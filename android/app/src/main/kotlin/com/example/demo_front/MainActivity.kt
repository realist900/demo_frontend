package com.example.demo_front

import android.R.attr.name
import android.R.attr.text
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)

        val params = Bundle()
        params.putString("image_name", "name")
        params.putString("full_text", "text")

    }
}
