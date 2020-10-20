import ${package_name}.domain.${model_name_uc};
import ${package_name}.dto.${model_name_uc}Param;
import ${package_name}.query.${model_name_uc}Query;
import ${package_name}.vo.CommonResult;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ${model_name_uc}Service {

    ${model_name_uc} findById(Long id);

    List<${model_name_uc}> findAll();

    ${model_name_uc} add(${model_name_uc}Param ${model_name_uc?uncap_first}Param);

    ${model_name_uc} modify(${model_name_uc}Param ${model_name_uc?uncap_first}Param);

    Page<${model_name_uc}> list(Pageable pageable,${model_name_uc}Query ${model_name_uc?uncap_first}Query);

    CommonResult deleteById(Long id);

}