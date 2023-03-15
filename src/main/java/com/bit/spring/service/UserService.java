package com.bit.spring.service;

import com.bit.spring.connector.MySqlConnector;
import com.bit.spring.model.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Service
public class UserService {
    private MySqlConnector connector;
    private Connection connection;

    @Autowired
    public UserService(MySqlConnector connector) {
        this.connector = connector;
        connection = this.connector.makeConnection();
    }

    public UserDTO auth(UserDTO attempt) {
        UserDTO userDTO = null;
        String query = "SELECT * FROM `user` WHERE `username` = ? AND `password` = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.setString(1, attempt.getUsername());
            pstmt.setString(2, attempt.getPassword());

            ResultSet resultSet = pstmt.executeQuery();
            if(resultSet.next()) {
                userDTO = new UserDTO();
                userDTO.setId(resultSet.getInt("id"));
                userDTO.setUsername(resultSet.getString("username"));
                userDTO.setNickname(resultSet.getString("nickname"));
            }

            resultSet.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userDTO;
    }
}
