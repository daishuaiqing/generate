import ${package_name}.domain.${model_name_uc};
import ${package_name}.dao.${model_name_uc}Dao;
import ${package_name}.dto.${model_name_uc}Param;
import ${package_name}.service.${model_name_uc}Service;
import ${package_name}.query.${model_name_uc}Query;
import ${package_name}.vo.CommonResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ${model_name_uc}ServiceImpl implements ${model_name_uc}Service {

    @Autowired
    private ${model_name_uc}Dao ${model_name_uc?uncap_first}Dao;

    /**
    * ${model_name_uc?uncap_first} 设置默认值
    * 创建时间，更新时间，是否删除
    * @param ${model_name_uc?uncap_first}
    */
    private void setDefaultValue(${model_name_uc} ${model_name_uc?uncap_first}) {
        ${model_name_uc?uncap_first}.setCreateTime(LocalDateTime.now());
        ${model_name_uc?uncap_first}.setUpdateTime(LocalDateTime.now());
        ${model_name_uc?uncap_first}.setDeleted(0);
    }

    @Override
    public ${model_name_uc} findById(Long id) {
        return ${model_name_uc?uncap_first}Dao.findById(id).orElse(null);
    }

    @Override
    public List<${model_name_uc}> findAll() {
        return ${model_name_uc?uncap_first}Dao.findAll();
    }

    @Override
    public ${model_name_uc} add(${model_name_uc}Param ${model_name_uc?uncap_first}Param) {
        ${model_name_uc} ${model_name_uc?uncap_first} = new ${model_name_uc}();
        BeanUtils.copyProperties(${model_name_uc?uncap_first}Param, ${model_name_uc?uncap_first});
        setDefaultValue(${model_name_uc?uncap_first});
        return ${model_name_uc?uncap_first}Dao.save(${model_name_uc?uncap_first});
    }

    @Override
    public ${model_name_uc} modify(${model_name_uc}Param ${model_name_uc?uncap_first}Param) {
        ${model_name_uc} data = ${model_name_uc?uncap_first}Dao.findById(${model_name_uc?uncap_first}Param.getId()).orElse(null);
        return ${model_name_uc?uncap_first}Dao.save(data);
    }

    @Override
    public Page<${model_name_uc}> list(Pageable pageable,${model_name_uc}Query ${model_name_uc?uncap_first}Query) {
        ${model_name_uc} ${model_name_uc?uncap_first} = new ${model_name_uc}();
        Example<${model_name_uc}> example = Example.of(${model_name_uc?uncap_first});
        return ${model_name_uc?uncap_first}Dao.findAll(example,pageable);
    }

    @Override
    public CommonResult deleteById(Long id) {
        ${model_name_uc?uncap_first}Dao.deleteById(id);
        return new CommonResult().success(!${model_name_uc?uncap_first}Dao.existsById(id));
    }


}