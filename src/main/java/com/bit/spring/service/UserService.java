package com.bit.spring.service;

import com.bit.spring.model.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
//    private MySqlConnector connector;
//    private Connection connection;

    private final String NAMESPACE = "mapper.UserMapper"; // 사용할 네임 스페이스
    private SqlSession session;

    @Autowired
    public UserService(SqlSession session) {
        this.session = session;
    }

    public boolean validate(String username) {
        return session.selectOne(NAMESPACE + ".validate", username) == null;
    }

    public boolean insert(UserDTO userDTO) {
        if(validate(userDTO.getUsername())) {
            session.insert(NAMESPACE + ".insert", userDTO);
            return true;
        } else {
            return false;
        }
    }

//    public void update(UserDTO userDTO) {
//        session.update(NAMESPACE + ".update", userDTO);
//    }
//
//    public void delete(int id) {
//        session.delete(NAMESPACE + ".delete", id);
//    }

    public UserDTO auth(UserDTO attempt) {
        return session.selectOne(NAMESPACE + ".auth", attempt);
    }

//    public String getNickname(int id) {
//        String nick = null;
//        String query = "SELECT `nickname` FROM `user` WHERE `id` = ?";
//
//        try {
//            PreparedStatement pstmt = connection.prepareStatement(query);
//            pstmt.setInt(1, id);
//
//            ResultSet resultSet = pstmt.executeQuery();
//            if (resultSet.next()) {
//                nick = resultSet.getString("nickname");
//            }
//            resultSet.close();
//            pstmt.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        return nick;
//    }
}
