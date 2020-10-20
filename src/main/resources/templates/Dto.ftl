import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ${model_name_uc}Param  {

<#if model_column?exists>
    <#list model_column as model>
        <#if model.column_name = 'id'>
    private Long id;

        <#elseif (model.column_name = 'create_time' || model.column_name = 'update_time' || model.column_name = 'is_deleted')>
        <#else>
    /**
    * ${model.column_comment!}
    */
    @ApiModelProperty(value="${model.column_comment!}")
    <#if (model.data_type = 'varchar' || model.data_type = 'text' || model.data_type = 'char' || model.data_type = 'longtext')>
    private String ${model.column_name_uc?uncap_first};

    </#if>
    <#if model.data_type = 'datetime'>
    private LocalDateTime ${model.column_name_uc?uncap_first};

    </#if>
    <#if model.data_type = 'date'>
    private LocalDate ${model.column_name_uc?uncap_first};

    </#if>
    <#if model.data_type = 'time'>
    private LocalTime ${model.column_name_uc?uncap_first};

    </#if>
    <#if (model.data_type = 'int' || model.data_type = 'int unsigned' || model.data_type = 'tinyint' || model.data_type = 'tinyint unsigned' || model.data_type = 'bit' || model.data_type = 'smallint')>
    private Integer ${model.column_name_uc?uncap_first};

    </#if>
    <#if model.data_type = 'bigint unsigned' || model.data_type = 'bigint'>
    private Long ${model.column_name_uc?uncap_first};

    </#if>
    <#if (model.data_type = 'decimal unsigned' || model.data_type = 'decimal')>
    private BigDecimal ${model.column_name_uc?uncap_first};

    </#if>
    <#if model.data_type = 'json'>
    private JSONObject ${model.column_name_uc?uncap_first};

    </#if>
        </#if>
    </#list>
</#if>

}