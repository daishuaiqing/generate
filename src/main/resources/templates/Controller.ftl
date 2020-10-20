
import ${package_name}.dto.${model_name_uc}Param;
import ${package_name}.query.PageParam;
import ${package_name}.service.${model_name_uc}Service;
import ${package_name}.query.${model_name_uc}Query;
import ${package_name}.vo.CommonResult;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class ${model_name_uc}Controller {

    @Autowired
    private ${model_name_uc}Service ${model_name_uc?uncap_first}Service;

    @ApiOperation("单个查询")
    @GetMapping("/${model_name}/find/{id}")
    public CommonResult findById(@PathVariable("id") Long id){
        return new CommonResult().success(${model_name_uc?uncap_first}Service.findById(id));
    }

    @ApiOperation("全部")
    @GetMapping("/${model_name}/find/all")
    public CommonResult findAll(){
        return new CommonResult().success(${model_name_uc?uncap_first}Service.findAll());
    }

    @ApiOperation("新增")
    @PostMapping("/${model_name}/add")
    public CommonResult add(@Valid @ApiParam @RequestBody ${model_name_uc}Param ${model_name_uc?uncap_first}Param,
                            BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return new CommonResult().validateFailed(bindingResult.getFieldError().getDefaultMessage());
        }else {
            return new CommonResult().success(${model_name_uc?uncap_first}Service.add(${model_name_uc?uncap_first}Param));
        }
    }

    @ApiOperation("删除")
    @GetMapping("/${model_name}/delete/{id}")
    public CommonResult deleteById(@PathVariable("id") Long id) {
        return ${model_name_uc?uncap_first}Service.deleteById(id);
    }

    @ApiOperation("修改")
    @PostMapping("/${model_name}/modify/{id}")
    public CommonResult modify(@PathVariable(name = "id",required = true) Long id,
                               @Valid @ApiParam @RequestBody ${model_name_uc}Param ${model_name_uc?uncap_first}Param,
                               BindingResult bindingResult) {
        ${model_name_uc?uncap_first}Param.setId(id);
        if(bindingResult.hasErrors()){
            return new CommonResult().validateFailed(bindingResult.getFieldError().getDefaultMessage());
        }else {
            return new CommonResult().success(${model_name_uc?uncap_first}Service.modify(${model_name_uc?uncap_first}Param));
        }
    }

    @ApiOperation("列表查询")
    @GetMapping("/${model_name}/list")
    public CommonResult list(PageParam page, ${model_name_uc}Query ${model_name_uc?uncap_first}Query) {
        Pageable pageable = PageRequest.of(page.getPageNum(),page.getPageSize());
        return new CommonResult().success(${model_name_uc?uncap_first}Service.list(pageable,${model_name_uc?uncap_first}Query));
    }
}