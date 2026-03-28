package com.example.cricrush

import android.content.Context
import android.graphics.*
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.widget.*
import com.google.android.gms.ads.nativead.*
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import androidx.core.graphics.toColorInt


class MediumNativeAdFactory(private val context: Context) :
    GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: Map<String, Any>?
    ): NativeAdView {

        val parent = FrameLayout(context)
        val adView = LayoutInflater.from(context).inflate(
            R.layout.medium_native, parent, false
        ) as NativeAdView

        // bind views
        val headlineView = adView.findViewById<TextView>(R.id.ad_text_headline)
        val bodyView = adView.findViewById<TextView>(R.id.ad_text_body)
        val subTextView = adView.findViewById<TextView>(R.id.ad_text_secondary)
        val iconView = adView.findViewById<ImageView>(R.id.ad_app_icon)
        val callToActionView = adView.findViewById<Button>(R.id.ad_call_to_action)
        val starRatingView = adView.findViewById<RatingBar>(R.id.ad_stars)
        val mediaView = adView.findViewById<MediaView>(R.id.ad_media)
        val adChoicesView = adView.findViewById<AdChoicesView>(R.id.ad_choices_view)
        val adBadge = adView.findViewById<TextView>(R.id.ad_notification_view)

        // assign to native ad view
        adView.headlineView = headlineView
        adView.bodyView = bodyView
        adView.advertiserView = subTextView
        adView.iconView = iconView
        adView.callToActionView = callToActionView
        adView.mediaView = mediaView
        adView.starRatingView = starRatingView
        adView.adChoicesView = adChoicesView

        // Set media view size
        val width = TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP, 140f, context.resources.displayMetrics
        ).toInt()

        val height = TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP, 125f, context.resources.displayMetrics
        ).toInt()

        mediaView.layoutParams = mediaView.layoutParams.apply {
            this.width = width
            this.height = height
        }

        mediaView.setImageScaleType(ImageView.ScaleType.FIT_CENTER)

        nativeAd.mediaContent?.let {
            mediaView.mediaContent = it
            mediaView.visibility = View.VISIBLE
        }

        // populate
        headlineView.text = nativeAd.headline
        bodyView.text = nativeAd.body ?: ""
        subTextView.text = nativeAd.advertiser ?: ""
        callToActionView.text = nativeAd.callToAction ?: ""

        // icon
        nativeAd.icon?.drawable?.let {
            iconView.setImageDrawable(it)
            iconView.visibility = View.VISIBLE
        } ?: run {
            iconView.visibility = View.GONE
        }

        // rating
        starRatingView?.let { ratingBar ->
            nativeAd.starRating?.toFloat()?.let { rating ->
                ratingBar.rating = rating
                ratingBar.visibility = View.VISIBLE
            } ?: run {
                ratingBar.visibility = View.GONE
            }
        }


        // custom options
        customOptions?.let {
            try {

                val bgColor = safeParseColor(it["backgroundColor"] as? String, "#FFFFFF")
                val textColor = safeParseColor(it["textColor"] as? String, "#000000")
                val subTextColor = safeParseColor(it["subTextColor"] as? String, "#666666")
                val buttonColor = safeParseColor(it["buttonColor"] as? String, "#1E88E5")
                val starColor = safeParseColor(it["startColor"] as? String, "#FFD700")

                // text colors
                headlineView.setTextColor(textColor)
                subTextView.setTextColor(textColor)
                bodyView.setTextColor(subTextColor)
                adBadge?.setTextColor(textColor)

                // background
                adView.background = GradientDrawable().apply {
                    cornerRadius = 0f
                    setColor(bgColor)
                }

                // CTA button
                val radius = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP, 8f, context.resources.displayMetrics
                )

                callToActionView.background = GradientDrawable().apply {
                    cornerRadius = radius
                    setColor(buttonColor)
                }

                // star color
                starRatingView.progressDrawable?.let {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        it.colorFilter = BlendModeColorFilter(starColor, BlendMode.SRC_ATOP)
                    } else {
                        @Suppress("DEPRECATION")
                        it.setColorFilter(starColor, PorterDuff.Mode.SRC_ATOP)
                    }
                }

                // Ad badge
                adBadge?.let { badge ->
                    badge.text = "Ad"
                    badge.visibility = View.VISIBLE

                    val badgeRadius = TypedValue.applyDimension(
                        TypedValue.COMPLEX_UNIT_DIP, 12f, context.resources.displayMetrics
                    )

                    val strokeWidth = TypedValue.applyDimension(
                        TypedValue.COMPLEX_UNIT_DIP, 1.5f, context.resources.displayMetrics
                    ).toInt()

                    badge.background = GradientDrawable().apply {
                        cornerRadius = badgeRadius
                        setStroke(strokeWidth, starColor)
                    }
                }

            } catch (ex: Exception) {
                ex.printStackTrace()
            }
        }

        adView.setNativeAd(nativeAd)
        return adView
    }

    private fun safeParseColor(color: String?, defaultColor: String): Int {
        return try {
            (color ?: defaultColor).toColorInt()
        } catch (e: Exception) {
            defaultColor.toColorInt()
        }
    }
}
