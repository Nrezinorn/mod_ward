/* 
mod_ward - Apache protection for a new era.
*/ 

#include "httpd.h"
#include "http_config.h"
#include "http_protocol.h"
#include "ap_config.h"

/* The sample content handler */
static int ward_handler(request_rec *r)
{
/*  Removed as we want to process on every request
    if (strcmp(r->handler, "ward")) {
        return DECLINED;
    }
*/
    r->content_type = "text/html";      

    if (!r->header_only)
        ap_rputs("The sample page from mod_ward.c\n", r);
    return OK;
}

static void ward_register_hooks(apr_pool_t *p)
{
    ap_hook_handler(ward_handler, NULL, NULL, APR_HOOK_MIDDLE);
}

/* Dispatch list for API hooks */
module AP_MODULE_DECLARE_DATA ward_module = {
    STANDARD20_MODULE_STUFF, 
    NULL,                  /* create per-dir    config structures */
    NULL,                  /* merge  per-dir    config structures */
    NULL,                  /* create per-server config structures */
    NULL,                  /* merge  per-server config structures */
    NULL,                  /* table of config file commands       */
    ward_register_hooks  /* register hooks                      */
};

