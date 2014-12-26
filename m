Content-Type: multipart/mixed; boundary="===============1885812749176098427=="
MIME-Version: 1.0
From: Lan Tianyu <tianyu.lan@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPI] 40e7fcb1929: acpi LNXVIDEO:00: Failed to evaluate _DEP.
Date: Fri, 26 Dec 2014 10:45:36 +0800
Message-ID: <549CCBD0.8050109@intel.com>
In-Reply-To: <1418374544.5745.127.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1885812749176098427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hI Rafael:
            The following error log are produced by
acpi_evaluate_reference().
It found _DEP returned package with 0 element and return AE_BAD_DATA.

>From dsdt table, _DEP may return package with 0 in some cases.  Can we
make acpi_evaluate_reference() not produce the error log and let caller
check
the package length?  So far, only thermal and _DEP use the function.

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                ADBG ("SAT0 DEP Call")
                If ((OSYS >=3D 0x07DD))
                {
                    If (((S0ID =3D=3D One) && ((PEPC & 0x03) !=3D Zero)))
                    {
                        ADBG ("SAT0 DEP")
                        Return (Package (0x01)
                        {
                            PEPD
                        })
                    }
                }

                ADBG ("SAT0 DEP NULL")
                Return (Package (0x00) {})
            }



On 2014=E5=B9=B412=E6=9C=8812=E6=97=A5 16:55, Huang Ying wrote:
> FYI, we noticed the changes on
>
> commit 40e7fcb19293cbdff02c74cb0668413480f82ea1 ("ACPI: Add _DEP support =
to fix battery issue on Asus T100TA")
>
> The dmesg is as follow and attached.
>
> [    1.332908] ACPI: Power Resource [PG00] (on)
> [    1.341096] ACPI: Power Resource [PG01] (on)
> [    1.349277] ACPI: Power Resource [PG02] (on)
> [    1.357600] ACPI: [Package] has zero elements (ffff880136a63ac0)
> [    1.364422] acpi LNXVIDEO:00: Failed to evaluate _DEP.
> [    1.379349] ACPI: [Package] has zero elements (ffff880136ac9080)
> [    1.386171] acpi device:2e: Failed to evaluate _DEP.
> [    1.393244] ACPI: [Package] has zero elements (ffff880136ac9140)
> [    1.400067] acpi INT3432:00: Failed to evaluate _DEP.
> [    1.408336] ACPI: [Package] has zero elements (ffff880136ac9700)
> [    1.415144] acpi INT3433:00: Failed to evaluate _DEP.
> [    1.425509] ACPI: [Package] has zero elements (ffff880136b47380)
> [    1.432333] acpi INT3434:00: Failed to evaluate _DEP.
> [    1.438566] ACPI: [Package] has zero elements (ffff880136b47500)
> [    1.445390] acpi INT3435:00: Failed to evaluate _DEP.
> [    1.451701] ACPI: [Package] has zero elements (ffff880136b47600)
> [    1.458526] acpi INT3436:00: Failed to evaluate _DEP.
> [    1.464734] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.471558] acpi INT3438:00: Failed to evaluate _DEP.
> [    1.477734] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.484556] acpi device:4b: Failed to evaluate _DEP.
> [    1.490566] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.497388] acpi device:4d: Failed to evaluate _DEP.
> [    1.503402] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.510226] acpi device:4f: Failed to evaluate _DEP.
> [    1.516237] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.523045] acpi device:51: Failed to evaluate _DEP.
> [    1.529055] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.535878] acpi device:53: Failed to evaluate _DEP.
> [    1.541898] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.548719] acpi device:55: Failed to evaluate _DEP.
> [    1.554724] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.561546] acpi device:57: Failed to evaluate _DEP.
> [    1.567545] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.574368] acpi device:59: Failed to evaluate _DEP.
> [    1.580116] ACPI: [Package] has zero elements (ffff880136b47700)
> [    1.586939] acpi device:5a: Failed to evaluate _DEP.
> [    1.593108] acpi ABCD0000:00: ACPI dock station (docks/bays count: 1)
> [    1.601756] ACPI: Power Resource [FN00] (off)
> [    1.606790] ACPI: Power Resource [FN01] (on)
>
> To reproduce:
>
> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> Thanks,
> Fengguang
>
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>


-- =

Best regards
Tianyu Lan


--===============1885812749176098427==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRm
LTgiIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSI+CiAgPC9oZWFkPgogIDxib2R5IGJnY29sb3I9
IiNGRkZGRkYiIHRleHQ9IiMwMDAwMDAiPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4
Ij5oSSBSYWZhZWw6PGJyPgogICAgICDCoMKgwqAgwqDCoMKgIMKgwqDCoCBUaGUgZm9sbG93aW5n
IGVycm9yIGxvZyBhcmUgcHJvZHVjZWQgYnkKICAgICAgYWNwaV9ldmFsdWF0ZV9yZWZlcmVuY2Uo
KS48YnI+CiAgICAgIEl0IGZvdW5kIF9ERVAgcmV0dXJuZWQgcGFja2FnZSB3aXRoIDAgZWxlbWVu
dCBhbmQgcmV0dXJuCiAgICAgIEFFX0JBRF9EQVRBLjxicj4KICAgICAgPGJyPgogICAgICBGcm9t
IGRzZHQgdGFibGUsIF9ERVAgbWF5IHJldHVybiBwYWNrYWdlIHdpdGggMCBpbiBzb21lIGNhc2Vz
LsKgCiAgICAgIENhbiB3ZTxicj4KICAgICAgbWFrZSBhY3BpX2V2YWx1YXRlX3JlZmVyZW5jZSgp
IG5vdCBwcm9kdWNlIHRoZSBlcnJvciBsb2cgYW5kIGxldAogICAgICBjYWxsZXIgY2hlY2s8YnI+
CiAgICAgIHRoZSBwYWNrYWdlIGxlbmd0aD/CoCBTbyBmYXIsIG9ubHkgdGhlcm1hbCBhbmQgX0RF
UCB1c2UgdGhlCiAgICAgIGZ1bmN0aW9uLjxicj4KICAgICAgPGJyPgogICAgICA8bWV0YSBodHRw
LWVxdWl2PSJjb250ZW50LXR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+
CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTWV0aG9kIChfREVQLCAwLCBOb3RTZXJpYWxp
emVkKcKgIC8vIF9ERVA6IERlcGVuZGVuY2llczxicj4KICAgICAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB7PGJyPgogICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQURCRyAoIlNB
VDAgREVQIENhbGwiKTxicj4KICAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElm
ICgoT1NZUyAmZ3Q7PSAweDA3REQpKTxicj4KICAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHs8YnI+CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IElmICgoKFMwSUQgPT0gT25lKSAmYW1wOyZhbXA7ICgoUEVQQyAmYW1wOwogICAgICAweDAzKSAh
PSBaZXJvKSkpPGJyPgogICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB7PGJyPgogICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIEFEQkcgKCJTQVQwIERFUCIpPGJyPgogICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJldHVybiAoUGFja2FnZSAoMHgwMSk8YnI+CiAgICAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgezxicj4KICAgICAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBF
UEQ8YnI+CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfSk8YnI+CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH08
YnI+CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9PGJyPgogICAgICA8YnI+
CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBREJHICgiU0FUMCBERVAgTlVM
TCIpPGJyPgogICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUmV0dXJuIChQYWNr
YWdlICgweDAwKSB7fSk8YnI+CiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTxicj4KICAg
ICAgPGJyPgogICAgICA8YnI+CiAgICAgIDxicj4KICAgICAgT24gMjAxNOW5tDEy5pyIMTLml6Ug
MTY6NTUsIEh1YW5nIFlpbmcgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSBj
aXRlPSJtaWQ6MTQxODM3NDU0NC41NzQ1LjEyNy5jYW1lbEBpbnRlbC5jb20iCiAgICAgIHR5cGU9
ImNpdGUiPgogICAgICA8cHJlIHdyYXA9IiI+RllJLCB3ZSBub3RpY2VkIHRoZSBjaGFuZ2VzIG9u
Cgpjb21taXQgNDBlN2ZjYjE5MjkzY2JkZmYwMmM3NGNiMDY2ODQxMzQ4MGY4MmVhMSAoIkFDUEk6
IEFkZCBfREVQIHN1cHBvcnQgdG8gZml4IGJhdHRlcnkgaXNzdWUgb24gQXN1cyBUMTAwVEEiKQoK
VGhlIGRtZXNnIGlzIGFzIGZvbGxvdyBhbmQgYXR0YWNoZWQuCgpbICAgIDEuMzMyOTA4XSBBQ1BJ
OiBQb3dlciBSZXNvdXJjZSBbUEcwMF0gKG9uKQpbICAgIDEuMzQxMDk2XSBBQ1BJOiBQb3dlciBS
ZXNvdXJjZSBbUEcwMV0gKG9uKQpbICAgIDEuMzQ5Mjc3XSBBQ1BJOiBQb3dlciBSZXNvdXJjZSBb
UEcwMl0gKG9uKQpbICAgIDEuMzU3NjAwXSBBQ1BJOiBbUGFja2FnZV0gaGFzIHplcm8gZWxlbWVu
dHMgKGZmZmY4ODAxMzZhNjNhYzApClsgICAgMS4zNjQ0MjJdIGFjcGkgTE5YVklERU86MDA6IEZh
aWxlZCB0byBldmFsdWF0ZSBfREVQLgpbICAgIDEuMzc5MzQ5XSBBQ1BJOiBbUGFja2FnZV0gaGFz
IHplcm8gZWxlbWVudHMgKGZmZmY4ODAxMzZhYzkwODApClsgICAgMS4zODYxNzFdIGFjcGkgZGV2
aWNlOjJlOiBGYWlsZWQgdG8gZXZhbHVhdGUgX0RFUC4KWyAgICAxLjM5MzI0NF0gQUNQSTogW1Bh
Y2thZ2VdIGhhcyB6ZXJvIGVsZW1lbnRzIChmZmZmODgwMTM2YWM5MTQwKQpbICAgIDEuNDAwMDY3
XSBhY3BpIElOVDM0MzI6MDA6IEZhaWxlZCB0byBldmFsdWF0ZSBfREVQLgpbICAgIDEuNDA4MzM2
XSBBQ1BJOiBbUGFja2FnZV0gaGFzIHplcm8gZWxlbWVudHMgKGZmZmY4ODAxMzZhYzk3MDApClsg
ICAgMS40MTUxNDRdIGFjcGkgSU5UMzQzMzowMDogRmFpbGVkIHRvIGV2YWx1YXRlIF9ERVAuClsg
ICAgMS40MjU1MDldIEFDUEk6IFtQYWNrYWdlXSBoYXMgemVybyBlbGVtZW50cyAoZmZmZjg4MDEz
NmI0NzM4MCkKWyAgICAxLjQzMjMzM10gYWNwaSBJTlQzNDM0OjAwOiBGYWlsZWQgdG8gZXZhbHVh
dGUgX0RFUC4KWyAgICAxLjQzODU2Nl0gQUNQSTogW1BhY2thZ2VdIGhhcyB6ZXJvIGVsZW1lbnRz
IChmZmZmODgwMTM2YjQ3NTAwKQpbICAgIDEuNDQ1MzkwXSBhY3BpIElOVDM0MzU6MDA6IEZhaWxl
ZCB0byBldmFsdWF0ZSBfREVQLgpbICAgIDEuNDUxNzAxXSBBQ1BJOiBbUGFja2FnZV0gaGFzIHpl
cm8gZWxlbWVudHMgKGZmZmY4ODAxMzZiNDc2MDApClsgICAgMS40NTg1MjZdIGFjcGkgSU5UMzQz
NjowMDogRmFpbGVkIHRvIGV2YWx1YXRlIF9ERVAuClsgICAgMS40NjQ3MzRdIEFDUEk6IFtQYWNr
YWdlXSBoYXMgemVybyBlbGVtZW50cyAoZmZmZjg4MDEzNmI0NzcwMCkKWyAgICAxLjQ3MTU1OF0g
YWNwaSBJTlQzNDM4OjAwOiBGYWlsZWQgdG8gZXZhbHVhdGUgX0RFUC4KWyAgICAxLjQ3NzczNF0g
QUNQSTogW1BhY2thZ2VdIGhhcyB6ZXJvIGVsZW1lbnRzIChmZmZmODgwMTM2YjQ3NzAwKQpbICAg
IDEuNDg0NTU2XSBhY3BpIGRldmljZTo0YjogRmFpbGVkIHRvIGV2YWx1YXRlIF9ERVAuClsgICAg
MS40OTA1NjZdIEFDUEk6IFtQYWNrYWdlXSBoYXMgemVybyBlbGVtZW50cyAoZmZmZjg4MDEzNmI0
NzcwMCkKWyAgICAxLjQ5NzM4OF0gYWNwaSBkZXZpY2U6NGQ6IEZhaWxlZCB0byBldmFsdWF0ZSBf
REVQLgpbICAgIDEuNTAzNDAyXSBBQ1BJOiBbUGFja2FnZV0gaGFzIHplcm8gZWxlbWVudHMgKGZm
ZmY4ODAxMzZiNDc3MDApClsgICAgMS41MTAyMjZdIGFjcGkgZGV2aWNlOjRmOiBGYWlsZWQgdG8g
ZXZhbHVhdGUgX0RFUC4KWyAgICAxLjUxNjIzN10gQUNQSTogW1BhY2thZ2VdIGhhcyB6ZXJvIGVs
ZW1lbnRzIChmZmZmODgwMTM2YjQ3NzAwKQpbICAgIDEuNTIzMDQ1XSBhY3BpIGRldmljZTo1MTog
RmFpbGVkIHRvIGV2YWx1YXRlIF9ERVAuClsgICAgMS41MjkwNTVdIEFDUEk6IFtQYWNrYWdlXSBo
YXMgemVybyBlbGVtZW50cyAoZmZmZjg4MDEzNmI0NzcwMCkKWyAgICAxLjUzNTg3OF0gYWNwaSBk
ZXZpY2U6NTM6IEZhaWxlZCB0byBldmFsdWF0ZSBfREVQLgpbICAgIDEuNTQxODk4XSBBQ1BJOiBb
UGFja2FnZV0gaGFzIHplcm8gZWxlbWVudHMgKGZmZmY4ODAxMzZiNDc3MDApClsgICAgMS41NDg3
MTldIGFjcGkgZGV2aWNlOjU1OiBGYWlsZWQgdG8gZXZhbHVhdGUgX0RFUC4KWyAgICAxLjU1NDcy
NF0gQUNQSTogW1BhY2thZ2VdIGhhcyB6ZXJvIGVsZW1lbnRzIChmZmZmODgwMTM2YjQ3NzAwKQpb
ICAgIDEuNTYxNTQ2XSBhY3BpIGRldmljZTo1NzogRmFpbGVkIHRvIGV2YWx1YXRlIF9ERVAuClsg
ICAgMS41Njc1NDVdIEFDUEk6IFtQYWNrYWdlXSBoYXMgemVybyBlbGVtZW50cyAoZmZmZjg4MDEz
NmI0NzcwMCkKWyAgICAxLjU3NDM2OF0gYWNwaSBkZXZpY2U6NTk6IEZhaWxlZCB0byBldmFsdWF0
ZSBfREVQLgpbICAgIDEuNTgwMTE2XSBBQ1BJOiBbUGFja2FnZV0gaGFzIHplcm8gZWxlbWVudHMg
KGZmZmY4ODAxMzZiNDc3MDApClsgICAgMS41ODY5MzldIGFjcGkgZGV2aWNlOjVhOiBGYWlsZWQg
dG8gZXZhbHVhdGUgX0RFUC4KWyAgICAxLjU5MzEwOF0gYWNwaSBBQkNEMDAwMDowMDogQUNQSSBk
b2NrIHN0YXRpb24gKGRvY2tzL2JheXMgY291bnQ6IDEpClsgICAgMS42MDE3NTZdIEFDUEk6IFBv
d2VyIFJlc291cmNlIFtGTjAwXSAob2ZmKQpbICAgIDEuNjA2NzkwXSBBQ1BJOiBQb3dlciBSZXNv
dXJjZSBbRk4wMV0gKG9uKQoKVG8gcmVwcm9kdWNlOgoKCWFwdC1nZXQgaW5zdGFsbCBydWJ5IHJ1
Ynktb2oKCWdpdCBjbG9uZSBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvd2ZnL2xrcC10ZXN0cy5naXQKCWNkIGxrcC10ZXN0cwoJYmluL3NldHVwLWxvY2FsIGpv
Yi55YW1sICMgdGhlIGpvYiBmaWxlIGF0dGFjaGVkIGluIHRoaXMgZW1haWwKCWJpbi9ydW4tbG9j
YWwgICBqb2IueWFtbAoKCkRpc2NsYWltZXI6ClJlc3VsdHMgaGF2ZSBiZWVuIGVzdGltYXRlZCBi
YXNlZCBvbiBpbnRlcm5hbCBJbnRlbCBhbmFseXNpcyBhbmQgYXJlIHByb3ZpZGVkCmZvciBpbmZv
cm1hdGlvbmFsIHB1cnBvc2VzIG9ubHkuIEFueSBkaWZmZXJlbmNlIGluIHN5c3RlbSBoYXJkd2Fy
ZSBvciBzb2Z0d2FyZQpkZXNpZ24gb3IgY29uZmlndXJhdGlvbiBtYXkgYWZmZWN0IGFjdHVhbCBw
ZXJmb3JtYW5jZS4KCgpUaGFua3MsCkZlbmdndWFuZwoKPC9wcmU+CiAgICAgIDxicj4KICAgICAg
PGZpZWxkc2V0IGNsYXNzPSJtaW1lQXR0YWNobWVudEhlYWRlciI+PC9maWVsZHNldD4KICAgICAg
PGJyPgogICAgICA8cHJlIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFi
YnJldmlhdGVkIiBocmVmPSJtYWlsdG86TEtQQGxpbnV4LmludGVsLmNvbSI+TEtQQGxpbnV4Lmlu
dGVsLmNvbTwvYT4KCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgPGJyPgog
ICAgPHByZSBjbGFzcz0ibW96LXNpZ25hdHVyZSIgY29scz0iNzIiPi0tIApCZXN0IHJlZ2FyZHMK
VGlhbnl1IExhbjwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============1885812749176098427==--

