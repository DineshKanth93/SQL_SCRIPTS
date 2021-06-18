create or replace function get_Saas_country_code (fa_subledger_code customer_master.code%type ) return varchar2

is 

cursor c1 is 
select country_code,branch_code from 
saas_customer_master
where customer_code=fa_subledger_code;
 r1 c1%rowtype;

 begin 

 open c1;
 fetch c1 into r1;
 close c1;

 if r1.country_code is not null then 


   return r1.country_code;


   else 
    return null;
  end if;

  exception
    when others then
        raise_application_error(-20001, remove_ora(sqlerrm));
end;


