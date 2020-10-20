import javax.persistence.*;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonInclude;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import java.time.LocalDateTime;

@Entity
@JsonInclude(JsonInclude.Include.NON_NULL)
@SQLDelete(sql = "update ${model_name} set is_deleted=1 where id=?")
@Where(clause = "is_deleted = 0")
@Table(name = "${model_name}")
@Data
public class ${model_name_uc}  {

    <#if model_column?exists>
        <#list model_column as model>
    <#if model.column_name = 'id'>
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    <#elseif model.column_name = 'is_deleted'>
    /**
     * 是否删除
     */
    @Column(name = "is_deleted")
    private Integer deleted;

    <#else>
    /**
    * ${model.column_comment!}
    */
    @Column(name = "${model.column_name}")
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