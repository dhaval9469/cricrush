package com.example.cricrush

import android.content.Context
import android.graphics.Color
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

class NativeBannerAdFactory(private val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: Map<String, Any>?
    ): NativeAdView {

        //        NativeAdView adView = (NativeAdView) LayoutInflater.from(context)
        //                .inflate(R.layout.native_banner, null);

        val tempParent = FrameLayout(context)
        val adView = LayoutInflater.from(context)
            .inflate(R.layout.native_banner, tempParent, false) as NativeAdView

        // Bind views
        val headlineView: TextView = adView.findViewById(R.id.ad_text_headline)
        val bodyView: TextView = adView.findViewById(R.id.ad_text_body)
        val iconView: ImageView = adView.findViewById(R.id.ad_app_icon)
        val callToActionView: Button = adView.findViewById(R.id.ad_call_to_action)
        val adChoicesView: AdChoicesView = adView.findViewById(R.id.ad_choices_view)
        val adBadge: TextView? = adView.findViewById(R.id.ad_notification_view)

        // Apply custom colors if available
        if (customOptions != null) {
            try {
//                int bgColor = Color.parseColor((String) customOptions.get("backgroundColor"));
//                int textColor = Color.parseColor((String) customOptions.get("textColor"));
//                int subTextColor = Color.parseColor((String) customOptions.get("subTextColor"));
//                int buttonColor = Color.parseColor((String) customOptions.get("buttonColor"));
                val bgColor = safeParseColor(customOptions["backgroundColor"] as String?, "#FFFFFF")
                val textColor = safeParseColor(customOptions["textColor"] as String?, "#000000")
                val subTextColor = safeParseColor(customOptions["subTextColor"] as String?, "#666666")
                val buttonColor = safeParseColor(customOptions["buttonColor"] as String?, "#1E88E5")
                val starColor = safeParseColor(customOptions["startColor"] as String?, "#FFD700")

                // Headline and body text colors
                headlineView.setTextColor(textColor)
                bodyView.setTextColor(subTextColor)
                adBadge?.setTextColor(textColor)

                // Background for the ad card
                val adViewRadiusInDp = 0f
                val adViewRadiusInPx = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP,
                    adViewRadiusInDp,
                    context.resources.displayMetrics
                )
                val adViewBgDrawable = GradientDrawable()
                adViewBgDrawable.cornerRadius = adViewRadiusInPx
                adViewBgDrawable.setColor(bgColor)
                adView.background = adViewBgDrawable

//                // Button background
//                val radiusInDp = 16f
//                val radiusInPx = TypedValue.applyDimension(
//                    TypedValue.COMPLEX_UNIT_DIP,
//                    radiusInDp,
//                    context.resources.displayMetrics
//                )
//
//                val shapeDrawable = GradientDrawable()
//                shapeDrawable.cornerRadius = radiusInPx
//
//                // Transparent fill
//                shapeDrawable.setColor(Color.TRANSPARENT)
//
//                // Border (stroke)
//                shapeDrawable.setStroke(
//                    TypedValue.applyDimension(
//                        TypedValue.COMPLEX_UNIT_DIP,
//                        1f, // border width = 2dp
//                        context.resources.displayMetrics
//                    ).toInt(),
//                    buttonColor // border color
//                )
//
//                // Apply background to button
//                callToActionView.background = shapeDrawable
//
//                // Optional: set text color to match border for better look
//                callToActionView.setTextColor(buttonColor)

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
                callToActionView.background = btnDrawable

                if (adBadge != null) {
                    adBadge.text = "Ad"
                    adBadge.visibility = View.VISIBLE

                    val badgeDrawable = GradientDrawable()
                    badgeDrawable.cornerRadius = 12f
                    badgeDrawable.setStroke(3, starColor)

                    adBadge.background = badgeDrawable

                    val badgeTextColor = safeParseColor(
                        customOptions["textColor"] as String?,
                        "#FFFFFF"
                    )
                    adBadge.setTextColor(badgeTextColor)
                }

            } catch (e: Exception) {
                e.printStackTrace()
            }
        }

        // Assign views to NativeAdView
        adView.headlineView = headlineView
        adView.bodyView = bodyView
        adView.iconView = iconView
        adView.callToActionView = callToActionView
        adView.adChoicesView = adChoicesView

        // Set ad content
        headlineView.text = nativeAd.headline

        if (nativeAd.body != null) {
            bodyView.text = nativeAd.body
            bodyView.visibility = View.VISIBLE
        } else {
            bodyView.visibility = View.GONE
        }

        if (nativeAd.callToAction != null) {
            callToActionView.text = nativeAd.callToAction
            callToActionView.visibility = View.VISIBLE
        } else {
            callToActionView.visibility = View.GONE
        }

        if (nativeAd.icon != null && nativeAd.icon!!.drawable != null) {
            iconView.setImageDrawable(nativeAd.icon!!.drawable)
            iconView.visibility = View.VISIBLE

            iconView.clipToOutline = true

            val radiusInDp = 0f
            val radiusInPx = TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_IN,
                radiusInDp,
                context.resources.displayMetrics
            )

            val bgDrawable = GradientDrawable()
            bgDrawable.cornerRadius = radiusInPx
            bgDrawable.setColor(Color.TRANSPARENT)
            iconView.background = bgDrawable

        } else {
            iconView.visibility = View.GONE
        }

        // Final binding
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
