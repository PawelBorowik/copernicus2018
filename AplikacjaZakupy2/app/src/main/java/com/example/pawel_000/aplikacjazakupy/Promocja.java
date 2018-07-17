package com.example.pawel_000.aplikacjazakupy;

import android.os.Bundle;

import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;


public class Promocja extends AppCompatActivity implements View.OnClickListener {


    private Button button;
    private TextView rezultat;
    private EditText editText, editText2;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_promocja);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        init();


        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    private void init() {
        button = (Button) findViewById( R.id.button);
        editText =(EditText) findViewById(R.id.editText);
        editText2 =(EditText) findViewById(R.id.editText2);
        rezultat =(TextView) findViewById(R.id.rezultat);

        button.setOnClickListener(this);
    }


    @Override
    public void onClick(View v) {
        String num1 = editText.getText().toString();
        String num2 = editText2.getText().toString();

        int adittion =Integer.parseInt(num1)-(Integer.parseInt(num1) * Integer.parseInt(num2) / 100);
        rezultat.setText(String.valueOf(adittion));

    }
}


