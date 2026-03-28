package com.example.cricrush

import android.content.Context
import android.graphics.drawable.GradientDrawable
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.AdChoicesView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import androidx.core.graphics.toColorInt

class SmallNativeAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: Map<String, Any>?
    ): NativeAdView {

        val tempParent = FrameLayout(context)
        val adView = LayoutInflater.from(context)
            .inflate(R.layout.native_small, tempParent, false) as NativeAdView

        // Binding views from layout
        val titleView: TextView = adView.findViewById(R.id.ad_text_headline)
        val descView: TextView = adView.findViewById(R.id.ad_text_body)
        val iconView: ImageView = adView.findViewById(R.id.ad_app_icon)
        val ctaButton: Button = adView.findViewById(R.id.ad_call_to_action)
        val adChoicesView: AdChoicesView = adView.findViewById(R.id.ad_choices_view)
        val adBadge: TextView? = adView.findViewById(R.id.ad_notification_view)

        // Set required views for Google Mobile Ads SDK
        adView.headlineView = titleView
        adView.bodyView = descView
        adView.iconView = iconView
        adView.callToActionView = ctaButton
        adView.adChoicesView = adChoicesView

        // Set native ad content
        titleView.text = nativeAd.headline ?: ""
        descView.text = nativeAd.body ?: ""
        ctaButton.text = nativeAd.callToAction ?: "Install"

        if (nativeAd.icon != null && nativeAd.icon!!.drawable != null) {
            iconView.setImageDrawable(nativeAd.icon!!.drawable)
            iconView.visibility = View.VISIBLE
        } else {
            iconView.visibility = View.GONE
        }

        // Handle styling from Dart
        if (customOptions != null) {
            try {
                val bgColor = safeParseColor(customOptions["backgroundColor"] as String?, "#FFFFFF")
                val textColor = safeParseColor(customOptions["textColor"] as String?, "#000000")
                val subTextColor = safeParseColor(customOptions["subTextColor"] as String?, "#666666")
                val buttonColor = safeParseColor(customOptions["buttonColor"] as String?, "#1E88E5")
                val starColor = safeParseColor(customOptions["startColor"] as String?, "#FFD700")

                // Text colors
                titleView.setTextColor(textColor)
                descView.setTextColor(subTextColor)
                adBadge?.setTextColor(textColor)

                // Background
                val bgCornerRadiusPx = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP,
                    0f,
                    context.resources.displayMetrics
                )
                val bgDrawable = GradientDrawable().apply {
                    cornerRadius = bgCornerRadiusPx
                    setColor(bgColor)
                }
                adView.background = bgDrawable

                // CTA Button styling
                val buttonRadiusPx = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP,
                    8f,
                    context.resources.displayMetrics
                )
                val btnDrawable = GradientDrawable().apply {
                    cornerRadius = buttonRadiusPx
                    setColor(buttonColor)
                }
                ctaButton.background = btnDrawable

                // Ad badge
                adBadge?.apply {
                    text = "Ad"
                    visibility = View.VISIBLE

                    val badgeDrawable = GradientDrawable().apply {
                        cornerRadius = 12f
                        setStroke(3, starColor)
                    }
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
