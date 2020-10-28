import ${package_name}.module.model.${model_name_uc}VO;
import ${package_name}.module.dao.${model_name_uc}DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ${model_name_uc}Service {

    @Autowired
    private ${model_name_uc}DAO ${model_name_uc?uncap_first}DAO;


    public ${model_name_uc}VO selectLast${model_name_uc}() {
        return ${model_name_uc?uncap_first}DAO.selectLast${model_name_uc}();
    }


    /**
    * 保存
    * @param blog
    * @return
    */
    public Long insertBlog${model_name_uc}(${model_name_uc}VO ${model_name_uc?uncap_first}) {
        return ${model_name_uc?uncap_first}DAO.insertBlog${model_name_uc}(${model_name_uc?uncap_first});
    }



}