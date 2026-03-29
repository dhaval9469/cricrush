package com.example.cricrush

import android.content.Context
import android.graphics.BlendMode
import android.graphics.BlendModeColorFilter
import android.graphics.PorterDuff
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.RatingBar
import android.widget.TextView
import com.google.android.gms.ads.nativead.AdChoicesView
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import androidx.core.graphics.toColorInt

class BigNativeAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: Map<String, Any>?
    ): NativeAdView {

        val tempParent = FrameLayout(context)
        val adView = LayoutInflater.from(context)
            .inflate(R.layout.big_native, tempParent, false) as NativeAdView

        // Bind views
        val headlineView: TextView = adView.findViewById(R.id.ad_text_headline)
        val bodyView: TextView = adView.findViewById(R.id.ad_text_body)
        val iconView: ImageView = adView.findViewById(R.id.ad_app_icon)
        val callToActionView: Button = adView.findViewById(R.id.ad_call_to_action)
        val starRatingView: RatingBar = adView.findViewById(R.id.ad_stars)
        val mediaView: MediaView = adView.findViewById(R.id.ad_media)
        val adChoicesView: AdChoicesView = adView.findViewById(R.id.ad_choices_view)
        val adBadge: TextView? = adView.findViewById(R.id.ad_notification_view)

        // Assign to NativeAdView
        adView.headlineView = headlineView
        adView.bodyView = bodyView
        adView.iconView = iconView
        adView.callToActionView = callToActionView
        adView.mediaView = mediaView
        adView.starRatingView = starRatingView
        adView.adChoicesView = adChoicesView

        // Populate views with ad data
        headlineView.text = nativeAd.headline
        bodyView.text = nativeAd.body ?: ""
        callToActionView.text = nativeAd.callToAction ?: ""

        if (nativeAd.icon != null && nativeAd.icon!!.drawable != null) {
            iconView.setImageDrawable(nativeAd.icon!!.drawable)
            iconView.visibility = View.VISIBLE
        } else {
            iconView.visibility = View.GONE
        }

        if (nativeAd.starRating != null) {
            starRatingView.rating = nativeAd.starRating!!.toFloat()
            starRatingView.visibility = View.VISIBLE
        } else {
            starRatingView.visibility = View.GONE
        }

        // Apply custom options if provided
        if (customOptions != null) {
            try {
                val bgColor = safeParseColor(customOptions["backgroundColor"] as String?, "#FFFFFF")
                val textColor = safeParseColor(customOptions["textColor"] as String?, "#000000")
                val subTextColor =
                    safeParseColor(customOptions["subTextColor"] as String?, "#666666")
                val buttonColor = safeParseColor(customOptions["buttonColor"] as String?, "#1E88E5")
                val starColor = safeParseColor(customOptions["startColor"] as String?, "#FFD700")

                // Text colors
                headlineView.setTextColor(textColor)
                bodyView.setTextColor(subTextColor)
                adBadge?.setTextColor(textColor)

                // Background card
                val backgroundDrawable = GradientDrawable().apply {
                    cornerRadius = 0f
                    setColor(bgColor)
                }
                adView.background = backgroundDrawable

                // CTA button styling
                val buttonRadiusPx = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP,
                    8f,
                    context.resources.displayMetrics
                )
                val btnDrawable = GradientDrawable().apply {
                    cornerRadius = buttonRadiusPx
                    setColor(buttonColor)
                }
                callToActionView.background = btnDrawable

                // Star color
                starRatingView.progressDrawable?.let {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        it.colorFilter = BlendModeColorFilter(starColor, BlendMode.SRC_ATOP)
                    } else {
                        @Suppress("DEPRECATION")
                        it.setColorFilter(starColor, PorterDuff.Mode.SRC_ATOP)
                    }
                }

                // Ad badge styling
                adBadge?.apply {
                    text = "Ad"
                    visibility = View.VISIBLE

                    val badgeDrawable = GradientDrawable()
                    badgeDrawable.cornerRadius = 12f
                    badgeDrawable.setStroke(3, starColor)
                    background = badgeDrawable

                    val badgeTextColor = safeParseColor(
                        customOptions["textColor"] as String?,
                        "#FFFFFF"
                    )
                    setTextColor(badgeTextColor)
                }

            } catch (e: Exception) {
                e.printStackTrace()
            }
        }

        adView.setNativeAd(nativeAd)
        return adView
    }

    private fun safeParseColor(colorStr: String?, defaultColor: String): Int {
        return try {
            (colorStr ?: defaultColor).toColorInt()
        } catch (e: Exception) {
            defaultColor.toColorInt()
        }
    }
}
