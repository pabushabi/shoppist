package com.pabushabi.shoppist

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.provideContent
import androidx.glance.currentState
import androidx.glance.background
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.padding
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.text.FontWeight
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import HomeWidgetGlanceState
import HomeWidgetGlanceStateDefinition
import android.annotation.TargetApi
import android.app.PendingIntent
import android.content.Intent
import android.os.Build

class HomeWidgetGlanceAppWidget : GlanceAppWidget() {

    //    override val stateDefinition: GlanceStateDefinition<*>?
//        get() = HomeWidgetGlanceStateDefinition()
    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            GlanceContent(context, currentState())
        }
    }

    @TargetApi(Build.VERSION_CODES.CUPCAKE)
    @Composable
    private fun GlanceContent(context: Context, currentState: HomeWidgetGlanceState) {
        val prefs = currentState.preferences
        val title = prefs.getString("headline", "My List") ?: "My List"
        val item1 = prefs.getString("list_item_1", "") ?: ""
        val item2 = prefs.getString("list_item_2", "") ?: ""
        val item3 = prefs.getString("list_item_3", "") ?: ""
        val item4 = prefs.getString("list_item_4", "") ?: ""
        val item5 = prefs.getString("list_item_5", "") ?: ""

        val intent =
            context.packageManager.getLaunchIntentForPackage(context.packageName) ?: Intent(
                context,
                MainActivity::class.java
            )

        Box(
            modifier = GlanceModifier
                .background(Color.White)
                .padding(16.dp)
                .clickable(androidx.glance.appwidget.action.actionStartActivity(intent))

        ) {
            Column {
                // Заголовок
                Text(
                    text = title,
                    style = TextStyle(
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold
                    ),
                    modifier = GlanceModifier.padding(bottom = 4.dp)
                )
                // Элементы списка
                Text(
                    text = item1,
                    style = TextStyle(fontSize = 16.sp),
                )
                Text(
                    text = item2,
                    style = TextStyle(fontSize = 16.sp),
                )
                Text(
                    text = item3,
                    style = TextStyle(fontSize = 16.sp),

                    )
                Text(
                    text = item4,
                    style = TextStyle(fontSize = 16.sp)
                )
                Text(
                    text = item5,
                    style = TextStyle(fontSize = 16.sp)
                )
            }
        }
    }
}
