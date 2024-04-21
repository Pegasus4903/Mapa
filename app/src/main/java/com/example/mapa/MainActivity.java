package com.example.mapa;

import android.location.LocationManager;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.view.LayoutInflater;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.mapbox.mapboxsdk.Mapbox;
import com.mapbox.mapboxsdk.camera.CameraPosition;
import com.mapbox.mapboxsdk.maps.MapView;

public class MainActivity extends AppCompatActivity{
    private MapView map;
    //private MyLocationNewOverlay mLocationOverlay;
    private LocationManager lm;
    private boolean enablePolyline = false;
    private long timeWhenStopped;
    //private ArrayList<GeoPoint> geoPoints;
    //private RoadManager roadManager;
    private int distanceRound;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Init MapLibre
        Mapbox.getInstance(this);

        // Init layout view
        LayoutInflater inflater = LayoutInflater.from(this);
        View rootView = inflater.inflate(R.layout.activity_main, null);
        setContentView(rootView);

        // Init the MapView
        map = rootView.findViewById(R.id.mapView);
        map.getMapAsync(map -> {
            map.setStyle("https://demotiles.maplibre.org/style.json");
            map.setCameraPosition(CameraPosition.DEFAULT);
        });

    }

    @Override
    protected void onStart() {
        super.onStart();
        map.onStart();
    }

    @Override
    protected void onResume() {
        super.onResume();
        map.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        map.onPause();
    }

    @Override
    protected void onStop() {
        super.onStop();
        map.onStop();
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
        map.onLowMemory();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        map.onDestroy();
    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState, @NonNull PersistableBundle outPersistentState) {
        super.onSaveInstanceState(outState, outPersistentState);
        map.onSaveInstanceState(outState);
    }
}
/*        Configuration.getInstance().load(getApplicationContext(),
                PreferenceManager.getDefaultSharedPreferences(getApplicationContext()));
        Configuration.getInstance().setUserAgentValue("MapaUserAgent/1.0");
        Configuration.getInstance().setDebugMode(true);

        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        setContentView(R.layout.activity_main);

        map = findViewById(R.id.map);
        map.setTileSource(TileSourceFactory.MAPNIK);

        IMapController mapController = map.getController();
        mapController.setZoom(18.8);


        GpsMyLocationProvider provider = new GpsMyLocationProvider(getApplicationContext());
        provider.addLocationSource(LocationManager.GPS_PROVIDER);
        mLocationOverlay = new MyLocationNewOverlay(provider, map);
        map.getOverlays().add(mLocationOverlay);
        mLocationOverlay.enableFollowLocation();
        mLocationOverlay.enableMyLocation();

        ToggleButton start_button = findViewById(R.id.start_button);
        AppBarLayout topBar = findViewById(R.id.topBar);
        Chronometer chrono = findViewById(R.id.textTime);

        geoPoints = new ArrayList<>();
        roadManager = new OSRMRoadManager(this, "MapaUserAgent/1.0");
        map.invalidate();

        lm = (LocationManager) this.getSystemService(Context.LOCATION_SERVICE);

        if (ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(this,
                Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
            return;
        }

        lm.requestLocationUpdates(LocationManager.GPS_PROVIDER, 3000, 10, this);

        Button finishButton = findViewById(R.id.finishButton);

        //The code for the button is reversed because when launching the map it would display "off"
        // instead of "on"
        start_button.setOnCheckedChangeListener((compoundButton, isChecked) -> {
            if(isChecked){
                StopChrono(chrono);
                enablePolyline = false;
                ConstraintLayout.LayoutParams params = (ConstraintLayout.LayoutParams) start_button.getLayoutParams();
                params.horizontalBias = 0.3f;
                start_button.setLayoutParams(params);

                finishButton.setVisibility(View.VISIBLE);

            }else{
                topBar.setVisibility(View.VISIBLE);
                StartChrono(chrono);
                enablePolyline = true;

                finishButton.setVisibility(View.GONE);

                ConstraintLayout.LayoutParams params = (ConstraintLayout.LayoutParams) start_button.getLayoutParams();
                params.horizontalBias = 0.5f;
                start_button.setLayoutParams(params);
            }
        });

        finishButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                displayDialog();
            }
        });
    }

    private void displayDialog() {
        Box<Session> sessionBox = ObjectBox.get().boxFor(Session.class);
        // create dialog
        final Dialog dialog=new Dialog(this);
        // set content view
        dialog.setContentView(R.layout.add_session_dialog);
        //Initialize width
        int width= WindowManager.LayoutParams.MATCH_PARENT;
        //Initialize height
        int height=WindowManager.LayoutParams.WRAP_CONTENT;
        //Set layout
        dialog.getWindow().setLayout(width,height);
        //show dialog
        dialog.show();

        Button saveButton = dialog.findViewById(R.id.save_button);
        Button cancelButton = dialog.findViewById(R.id.cancel_button);
        EditText titreText = dialog.findViewById(R.id.edit_titre);

        saveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(titreText.getText().toString().isEmpty()){
                    Toast.makeText(MainActivity.this, "Please fill the title",
                            Toast.LENGTH_SHORT).show();
                }else{
                    Session session = new Session();
                    session.setTitle(titreText.getText().toString());
                    session.setDistance(distanceRound);
                    session.setTime((int)timeWhenStopped);
                    session.setDateSession(new Date());

                    sessionBox.put(session);

                    startActivity(new Intent(getApplicationContext(), listSessionActivity.class));
                    finish();
                }
            }
        });

        cancelButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                titreText.setText("");
                dialog.hide();
            }
        });
    }

    private void StopChrono(Chronometer chrono) {
        chrono.stop();
        timeWhenStopped = chrono.getBase() - SystemClock.elapsedRealtime();
    }

    private void StartChrono(Chronometer chrono) {
        chrono.setBase(SystemClock.elapsedRealtime() + timeWhenStopped);
        chrono.start();
    }

    @Override
    public void onResume() {
        super.onResume();
        //this will refresh the osmdroid configuration on resuming.
        //if you make changes to the configuration, use
        //SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        //Configuration.getInstance().load(this, PreferenceManager.getDefaultSharedPreferences(this));
        map.onResume(); //needed for compass, my location overlays, v6.0.0 and up
    }

    @Override
    public void onPause() {
        super.onPause();
        //this will refresh the osmdroid configuration on resuming.
        //if you make changes to the configuration, use
        //SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        //Configuration.getInstance().save(this, prefs);
        map.onPause();  //needed for compass, my location overlays, v6.0.0 and up
    }

    @SuppressLint("DefaultLocale")
    @Override
    public void onLocationChanged(@NonNull Location location) {
        if(enablePolyline){
            GeoPoint newPoint = new GeoPoint(location.getLatitude(), location.getLongitude(), 0);
            geoPoints.add(newPoint);
            Road road = roadManager.getRoad(geoPoints);
            Polyline poly = RoadManager.buildRoadOverlay(road);
            map.getOverlays().add(poly);
            map.invalidate();

            TextView textDistance = findViewById(R.id.textDistance);
            double distance = poly.getDistance();
            distanceRound = (int)distance;
            textDistance.setText(String.format("%d m", distanceRound));
        }
    }
}*/