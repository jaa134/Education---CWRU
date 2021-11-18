package com.example.assignment1;

import android.support.design.widget.TextInputEditText;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.ListView;
import android.widget.ArrayAdapter;
import android.widget.Toast;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import java.util.ArrayList;
import java.util.Random;
import android.text.TextWatcher;
import android.text.Editable;

public class ContentProviderActivity extends AppCompatActivity {

    private ListView list_contacts;
    private TextInputEditText input_name;
    private TextInputEditText input_number;
    private Button btn_add;
    private Button btn_clear;
    private TextView label_empty;

    private ArrayAdapter<String> adapter;
    private ArrayList<String> listItems;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_content_provider);

        list_contacts = findViewById(R.id.list_contacts);
        input_name = findViewById(R.id.input_name);
        input_number = findViewById(R.id.input_number);
        btn_add = findViewById(R.id.btn_add);
        btn_clear = findViewById(R.id.btn_clear);
        label_empty = findViewById(R.id.label_empty);

        btn_add.setEnabled(false);
        btn_clear.setEnabled(false);

        input_name.addTextChangedListener(new TextWatcher() {
            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                btn_add.setEnabled(!input_number.getText().toString().trim().isEmpty() && s.toString().trim().length() > 0);
            }

            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) { }

            @Override
            public void afterTextChanged(Editable s) { }
        });

        input_number.addTextChangedListener(new TextWatcher() {
            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                btn_add.setEnabled(!input_name.getText().toString().trim().isEmpty() && s.toString().trim().length() > 0);
            }

            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) { }

            @Override
            public void afterTextChanged(Editable s) { }
        });

        listItems = new ArrayList<>();
        adapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, listItems);
        list_contacts.setAdapter(adapter);

        updateList();
    }

    public void onAdd(android.view.View view) {
        if (!isValidContactInfo()) {
            handleSaveError();
            return;
        }

        saveContact();
        updateList();

        input_name.setText("");
        input_number.setText("");

        input_name.clearFocus();
        input_number.clearFocus();
    }

    public void onReset(android.view.View view) {
        resetContacts();
        updateList();

        input_name.clearFocus();
        input_number.clearFocus();
    }

    private boolean isValidContactInfo() {
        return input_name.getText() != null && input_name.getText().length() > 0
                && input_number.getText() != null && input_number.getText().length() > 0;
    }

    private void saveContact() {
        ContentValues values  = new ContentValues();
        values.put(ContactDatabase.ID, new Random().nextInt(100));
        values.put(ContactDatabase.NAME, input_name.getText().toString());
        values.put(ContactDatabase.PHONE, input_number.getText().toString());
        getApplicationContext().getContentResolver().insert(MyContentProvider.CONTENT_URI,values);

        Toast.makeText(this, "Contact saved!", Toast.LENGTH_LONG).show();
    }

    private void resetContacts() {
        int delcount = getContentResolver().delete(MyContentProvider.CONTENT_URI,null,null);

        Toast.makeText(this,"Deleted " + delcount + " rows!",Toast.LENGTH_SHORT).show();
    }

    private void updateList() {
        Uri uri = MyContentProvider.CONTENT_URI;
        Cursor cursor = this.getContentResolver().query(uri,null,null,null,null);

        listItems.clear();
        while (cursor.moveToNext()){
            StringBuilder sb = new StringBuilder();
            sb.append(cursor.getString(0) + ",");
            sb.append(cursor.getString(1) + ",");
            sb.append(cursor.getString(2));
            listItems.add(sb.toString());
        }
        adapter.notifyDataSetChanged();

        if (listItems.isEmpty()) {
            label_empty.setVisibility(View.VISIBLE);
            list_contacts.setVisibility(View.GONE);
            btn_clear.setEnabled(false);
        }
        else {
            label_empty.setVisibility(View.GONE);
            list_contacts.setVisibility(View.VISIBLE);
            btn_clear.setEnabled(true);
        }
    }

    private void handleSaveError() {
        Toast.makeText(this, "Contact not saved!", Toast.LENGTH_LONG).show();
    }
}
