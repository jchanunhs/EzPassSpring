package com.example.dao;

import com.example.model.Vehicle;
import java.util.List;

public interface VehicleDAO {
    public boolean checkVehicle(Vehicle vehicle);
    public boolean addVehicle(Vehicle vehicle);
    public boolean removeVehicle(Vehicle vehicle);
    public List<Vehicle> getAllCustomerVehicles(String CustomerID);  
}
