;; Purpose of this file
;;  Simply as it contains all the important defines and macros to reduce the
;;  cluttering and more lines just for the definitions and macros
;;
;; ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
;; //--------------------------------------------------------------------------------------//
;; //                                                                                      //
;; //                              CONTROL FUNCTIONS SECTION                               //
;; //                                                                                      //
;; //--------------------------------------------------------------------------------------//
;;
;; ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

%define __DFP_CONTR_CBIT        0x0000
%define __DFP_CONTR_DVCID       0x0002
%define __DFP_CONTR_RTRYCNT     0x0003
%define __DFP_CONTR_STATOUT     0x0004
%define __DFP_CONTR_ERRCOUT     0x0005
%define __DFP_CONTR_SECTCNT     0x0006

;; // ---- LBA BYTE CONTROL -----------------------------------------------------------------

;; LBA28
%define __DFP_CONTR_OFBIT       0x0008
%define __DFP_CONTR_LBA28_HI    0x0009
%define __DFP_CONTR_LBA28_MI    0x000A
%define __DFP_CONTR_LBA28_LO    0x000B

;; LBA48
%define __DFP_CONTR_LBA48_HI    0x0009
%define __DFP_CONTR_LBA48_HMI   0x000A
%define __DFP_CONTR_LBA48_MLO   0x000B
%define __DFP_CONTR_LBA48_MHI   0x000C
%define __DFP_CONTR_LBA48_LMI   0x000D
%define __DFP_CONTR_LBA48_LO    0x000E

;; Usually the defined constant is all that you need. You can include this in your code if you need to.


;; ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
;; //--------------------------------------------------------------------------------------//
;; //                                                                                      //
;; //                                FUNCTION BUFFER SPACE                                 //
;; //                                                                                      //
;; //--------------------------------------------------------------------------------------//
;;
;; ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬

%define __DFP_FBS_BFRADDR16     0x10
%define __DFP_FBS_BFRADDR32     0x14
%define __RESERVED__            0x18