Content-Type: multipart/mixed; boundary="===============2358269533138540613=="
MIME-Version: 1.0
From: Janis Danisevskis <jdanis@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3f40a9185a: kernel BUG at kernel/cred.c:768!
Date: Fri, 30 Sep 2016 09:10:16 +0000
Message-ID: <CAAdwW5Owhr07LrxmoBWuCLVW7hVZxPvXOKVGb+ipKOFhQh3_+A@mail.gmail.com>
In-Reply-To: <57ed9c80.HCJe/31KIVzJsQS4%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2358269533138540613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Jann: I guess a environ_(mem_)release is needed because private_data of mem
and environ are now different.

On Thu, Sep 29, 2016 at 11:58 PM kernel test robot <xiaolong.ye@intel.com>
wrote:

> FYI, we noticed the following commit:
>
> https://github.com/0day-ci/linux
> Jann-Horn/fs-exec-don-t-force-writing-memory-access/20160929-222244
> commit 3f40a9185af5f5335b8117178c706b74537b960b ("mm: add LSM hook for
> writes to readonly memory")
>
> in testcase: boot
>
> on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -m
> 360M
>
> caused below changes:
>
>
> +------------------------------------------+------------+------------+
> |                                          | dc00268ef0 | 3f40a9185a |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 24         | 2          |
> | boot_failures                            | 0          | 18         |
> | kernel_BUG_at_kernel/cred.c              | 0          | 12         |
> | invalid_opcode:#[##]SMP                  | 0          | 12         |
> | EIP_is_at__invalid_creds                 | 0          | 12         |
> | calltrace:SyS_exit_group                 | 0          | 18         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 18         |
> | BUG:unable_to_handle_kernel              | 0          | 10         |
> | Oops                                     | 0          | 10         |
> | EIP_is_at_mem_release                    | 0          | 10         |
> +------------------------------------------+------------+------------+
>
>
>
> [   23.725743] trinity-c0 (12124) used greatest stack depth: 6144 bytes
> left
> [   23.729863] CRED: ->security {83184389, d88918c4}
> [   23.730466] ------------[ cut here ]------------
> [   23.731054] kernel BUG at kernel/cred.c:768!
> [   23.731770] invalid opcode: 0000 [#1] SMP
> [   23.732270] Modules linked in:
> [   23.732674] CPU: 0 PID: 10617 Comm: trinity-main Not tainted
> 4.8.0-rc8-00015-g3f40a91 #78
> [   23.733678] task: 8c79a6c0 task.stack: 8c48c000
> [   23.734248] EIP: 0060:[<8104cad8>] EFLAGS: 00010292 CPU: 0
> [   23.734962] EIP is at __invalid_creds+0x35/0x37
> [   23.735523] EAX: 00000025 EBX: 8d11a458 ECX: 8106ce3c EDX: 00000001
> [   23.736304] ESI: 813d667c EDI: 0000010f EBP: 8c48ded4 ESP: 8c48deb8
> [   23.737080]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
> [   23.737750] CR0: 80050033 CR2: 7fc1ed30 CR3: 01647000 CR4: 00040690
> [   23.738529] DR0: c0100220 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [   23.739308] DR6: ffff0ff0 DR7: 00050602
> [   23.739793] Stack:
> [   23.740054]  813d6660 813d667c 0000010f 813d6643 8d11a458 8d03ab80
> 8847b8e4 8c48dee4
> [   23.741161]  811153aa 8ca8f6c0 00000010 8c48df08 810de5a9 8ca8f6c8
> 88460a18 8847b8e4
> [   23.742265]  93c83c50 8ca8f6c0 8c79a6c0 8ca8e700 8c48df10 810de65c
> 8c48df28 8104a7a7
> [   23.743369] Call Trace:
> [   23.743700]  [<811153aa>] mem_release+0x35/0x4e
> [   23.744284]  [<810de5a9>] __fput+0xd8/0x162
> [   23.744815]  [<810de65c>] ____fput+0x8/0xa
> [   23.745333]  [<8104a7a7>] task_work_run+0x54/0x78
> [   23.745935]  [<8103a20a>] do_exit+0x33c/0x7ec
> [   23.746478]  [<810dd644>] ? vfs_write+0x9a/0xa4
> [   23.747051]  [<8103a711>] do_group_exit+0x30/0x86
> [   23.747634]  [<8103a778>] SyS_exit_group+0x11/0x11
> [   23.748236]  [<81000e0b>] do_int80_syscall_32+0x43/0x55
> [   23.748909]  [<812b8911>] entry_INT80_32+0x31/0x31
> [   23.749503] Code: 89 cf 68 43 66 3d 81 e8 1e 9a 05 00 57 56 68 60 66 3d
> 81 e8 12 9a 05 00 64 8b 0d dc 8a 4f 81 ba 72 66 3d 81 89 d8 e8 ac fe ff ff
> <0f> 0b 81 78 0c 64 65 73 43 74 08 55 89 e5 e8 b8 ff ff ff c3 55
> [   23.753032] EIP: [<8104cad8>] __invalid_creds+0x35/0x37 SS:ESP
> 0068:8c48deb8
> [   23.753971] ---[ end trace e46a82be55c05913 ]---
> [   23.754894] BUG: unable to handle kernel NULL pointer dereference at
>  (null)
>
>
>
>
>
> Thanks,
> Kernel Test Robot
>

--===============2358269533138540613==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+SmFubjogSSBndWVzcyBhIGVudmlyb25fKG1lbV8pcmVsZWFzZSBpcyBu
ZWVkZWQgYmVjYXVzZSBwcml2YXRlX2RhdGEgb2YgbWVtIGFuZCBlbnZpcm9uIGFyZSBub3cgZGlm
ZmVyZW50LjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciI+
T24gVGh1LCBTZXAgMjksIDIwMTYgYXQgMTE6NTggUE0ga2VybmVsIHRlc3Qgcm9ib3QgJmx0Ozxh
IGhyZWY9Im1haWx0bzp4aWFvbG9uZy55ZUBpbnRlbC5jb20iPnhpYW9sb25nLnllQGludGVsLmNv
bTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUi
IHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRk
aW5nLWxlZnQ6MWV4Ij5GWUksIHdlIG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQ6PGJyIGNs
YXNzPSJnbWFpbF9tc2ciPgo8YnIgY2xhc3M9ImdtYWlsX21zZyI+CjxhIGhyZWY9Imh0dHBzOi8v
Z2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4IiByZWw9Im5vcmVmZXJyZXIiIGNsYXNzPSJnbWFpbF9t
c2ciIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9saW51eDwvYT4g
SmFubi1Ib3JuL2ZzLWV4ZWMtZG9uLXQtZm9yY2Utd3JpdGluZy1tZW1vcnktYWNjZXNzLzIwMTYw
OTI5LTIyMjI0NDxiciBjbGFzcz0iZ21haWxfbXNnIj4KY29tbWl0IDNmNDBhOTE4NWFmNWY1MzM1
YjgxMTcxNzhjNzA2Yjc0NTM3Yjk2MGIgKCZxdW90O21tOiBhZGQgTFNNIGhvb2sgZm9yIHdyaXRl
cyB0byByZWFkb25seSBtZW1vcnkmcXVvdDspPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgo8YnIgY2xh
c3M9ImdtYWlsX21zZyI+CmluIHRlc3RjYXNlOiBib290PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgo8
YnIgY2xhc3M9ImdtYWlsX21zZyI+Cm9uIHRlc3QgbWFjaGluZTogcWVtdS1zeXN0ZW0taTM4NiAt
ZW5hYmxlLWt2bSAtY3B1IEhhc3dlbGwsK3NtZXAsK3NtYXAgLW0gMzYwTTxiciBjbGFzcz0iZ21h
aWxfbXNnIj4KPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpjYXVzZWQgYmVsb3cgY2hhbmdlczo8YnIg
Y2xhc3M9ImdtYWlsX21zZyI+CjxiciBjbGFzcz0iZ21haWxfbXNnIj4KPGJyIGNsYXNzPSJnbWFp
bF9tc2ciPgorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0rPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgp8wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCBkYzAw
MjY4ZWYwIHwgM2Y0MGE5MTg1YSB8PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgorLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0r
PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgp8IGJvb3Rfc3VjY2Vzc2VzwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDI0wqAgwqAgwqAgwqAgwqB8IDLCoCDCoCDCoCDCoCDC
oCB8PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgp8IGJvb3RfZmFpbHVyZXPCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDE4wqAgwqAgwqAg
wqAgwqB8PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgp8IGtlcm5lbF9CVUdfYXRfa2VybmVsL2NyZWQu
Y8KgIMKgIMKgIMKgIMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwgMTLCoCDCoCDCoCDCoCDC
oHw8YnIgY2xhc3M9ImdtYWlsX21zZyI+CnwgaW52YWxpZF9vcGNvZGU6I1sjI11TTVDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDEywqAgwqAgwqAgwqAgwqB8
PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgp8IEVJUF9pc19hdF9faW52YWxpZF9jcmVkc8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCAxMsKgIMKgIMKgIMKgIMKgfDxi
ciBjbGFzcz0iZ21haWxfbXNnIj4KfCBjYWxsdHJhY2U6U3lTX2V4aXRfZ3JvdXDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHwgMMKgIMKgIMKgIMKgIMKgIHwgMTjCoCDCoCDCoCDCoCDCoHw8YnIg
Y2xhc3M9ImdtYWlsX21zZyI+CnwgS2VybmVsX3BhbmljLW5vdF9zeW5jaW5nOkZhdGFsX2V4Y2Vw
dGlvbiB8IDDCoCDCoCDCoCDCoCDCoCB8IDE4wqAgwqAgwqAgwqAgwqB8PGJyIGNsYXNzPSJnbWFp
bF9tc2ciPgp8IEJVRzp1bmFibGVfdG9faGFuZGxlX2tlcm5lbMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHwgMMKgIMKgIMKgIMKgIMKgIHwgMTDCoCDCoCDCoCDCoCDCoHw8YnIgY2xhc3M9ImdtYWlsX21z
ZyI+CnwgT29wc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfCAwwqAgwqAgwqAgwqAgwqAgfCAxMMKgIMKgIMKgIMKgIMKgfDxiciBjbGFzcz0i
Z21haWxfbXNnIj4KfCBFSVBfaXNfYXRfbWVtX3JlbGVhc2XCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB8IDDCoCDCoCDCoCDCoCDCoCB8IDEwwqAgwqAgwqAgwqAgwqB8PGJyIGNsYXNzPSJn
bWFpbF9tc2ciPgorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0rPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgo8YnIgY2xhc3M9
ImdtYWlsX21zZyI+CjxiciBjbGFzcz0iZ21haWxfbXNnIj4KPGJyIGNsYXNzPSJnbWFpbF9tc2ci
PgpbwqAgwqAyMy43MjU3NDNdIHRyaW5pdHktYzAgKDEyMTI0KSB1c2VkIGdyZWF0ZXN0IHN0YWNr
IGRlcHRoOiA2MTQ0IGJ5dGVzIGxlZnQ8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjcy
OTg2M10gQ1JFRDogLSZndDtzZWN1cml0eSB7ODMxODQzODksIGQ4ODkxOGM0fTxiciBjbGFzcz0i
Z21haWxfbXNnIj4KW8KgIMKgMjMuNzMwNDY2XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0t
LS0tLS0tLS08YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjczMTA1NF0ga2VybmVsIEJV
RyBhdCBrZXJuZWwvY3JlZC5jOjc2OCE8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjcz
MTc3MF0gaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMxXSBTTVA8YnIgY2xhc3M9ImdtYWlsX21zZyI+
ClvCoCDCoDIzLjczMjI3MF0gTW9kdWxlcyBsaW5rZWQgaW46PGJyIGNsYXNzPSJnbWFpbF9tc2ci
PgpbwqAgwqAyMy43MzI2NzRdIENQVTogMCBQSUQ6IDEwNjE3IENvbW06IHRyaW5pdHktbWFpbiBO
b3QgdGFpbnRlZCA0LjguMC1yYzgtMDAwMTUtZzNmNDBhOTEgIzc4PGJyIGNsYXNzPSJnbWFpbF9t
c2ciPgpbwqAgwqAyMy43MzM2NzhdIHRhc2s6IDhjNzlhNmMwIHRhc2suc3RhY2s6IDhjNDhjMDAw
PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43MzQyNDhdIEVJUDogMDA2MDpbJmx0Ozgx
MDRjYWQ4Jmd0O10gRUZMQUdTOiAwMDAxMDI5MiBDUFU6IDA8YnIgY2xhc3M9ImdtYWlsX21zZyI+
ClvCoCDCoDIzLjczNDk2Ml0gRUlQIGlzIGF0IF9faW52YWxpZF9jcmVkcysweDM1LzB4Mzc8YnIg
Y2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjczNTUyM10gRUFYOiAwMDAwMDAyNSBFQlg6IDhk
MTFhNDU4IEVDWDogODEwNmNlM2MgRURYOiAwMDAwMDAwMTxiciBjbGFzcz0iZ21haWxfbXNnIj4K
W8KgIMKgMjMuNzM2MzA0XSBFU0k6IDgxM2Q2NjdjIEVESTogMDAwMDAxMGYgRUJQOiA4YzQ4ZGVk
NCBFU1A6IDhjNDhkZWI4PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43MzcwODBdwqAg
RFM6IDAwN2IgRVM6IDAwN2IgRlM6IDAwZDggR1M6IDAwZTAgU1M6IDAwNjg8YnIgY2xhc3M9Imdt
YWlsX21zZyI+ClvCoCDCoDIzLjczNzc1MF0gQ1IwOiA4MDA1MDAzMyBDUjI6IDdmYzFlZDMwIENS
MzogMDE2NDcwMDAgQ1I0OiAwMDA0MDY5MDxiciBjbGFzcz0iZ21haWxfbXNnIj4KW8KgIMKgMjMu
NzM4NTI5XSBEUjA6IGMwMTAwMjIwIERSMTogMDAwMDAwMDAgRFIyOiAwMDAwMDAwMCBEUjM6IDAw
MDAwMDAwPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43MzkzMDhdIERSNjogZmZmZjBm
ZjAgRFI3OiAwMDA1MDYwMjxiciBjbGFzcz0iZ21haWxfbXNnIj4KW8KgIMKgMjMuNzM5NzkzXSBT
dGFjazo8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjc0MDA1NF3CoCA4MTNkNjY2MCA4
MTNkNjY3YyAwMDAwMDEwZiA4MTNkNjY0MyA4ZDExYTQ1OCA4ZDAzYWI4MCA4ODQ3YjhlNCA4YzQ4
ZGVlNDxiciBjbGFzcz0iZ21haWxfbXNnIj4KW8KgIMKgMjMuNzQxMTYxXcKgIDgxMTE1M2FhIDhj
YThmNmMwIDAwMDAwMDEwIDhjNDhkZjA4IDgxMGRlNWE5IDhjYThmNmM4IDg4NDYwYTE4IDg4NDdi
OGU0PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43NDIyNjVdwqAgOTNjODNjNTAgOGNh
OGY2YzAgOGM3OWE2YzAgOGNhOGU3MDAgOGM0OGRmMTAgODEwZGU2NWMgOGM0OGRmMjggODEwNGE3
YTc8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjc0MzM2OV0gQ2FsbCBUcmFjZTo8YnIg
Y2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjc0MzcwMF3CoCBbJmx0OzgxMTE1M2FhJmd0O10g
bWVtX3JlbGVhc2UrMHgzNS8weDRlPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43NDQy
ODRdwqAgWyZsdDs4MTBkZTVhOSZndDtdIF9fZnB1dCsweGQ4LzB4MTYyPGJyIGNsYXNzPSJnbWFp
bF9tc2ciPgpbwqAgwqAyMy43NDQ4MTVdwqAgWyZsdDs4MTBkZTY1YyZndDtdIF9fX19mcHV0KzB4
OC8weGE8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjc0NTMzM13CoCBbJmx0OzgxMDRh
N2E3Jmd0O10gdGFza193b3JrX3J1bisweDU0LzB4Nzg8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvC
oCDCoDIzLjc0NTkzNV3CoCBbJmx0OzgxMDNhMjBhJmd0O10gZG9fZXhpdCsweDMzYy8weDdlYzxi
ciBjbGFzcz0iZ21haWxfbXNnIj4KW8KgIMKgMjMuNzQ2NDc4XcKgIFsmbHQ7ODEwZGQ2NDQmZ3Q7
XSA/IHZmc193cml0ZSsweDlhLzB4YTQ8YnIgY2xhc3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjc0
NzA1MV3CoCBbJmx0OzgxMDNhNzExJmd0O10gZG9fZ3JvdXBfZXhpdCsweDMwLzB4ODY8YnIgY2xh
c3M9ImdtYWlsX21zZyI+ClvCoCDCoDIzLjc0NzYzNF3CoCBbJmx0OzgxMDNhNzc4Jmd0O10gU3lT
X2V4aXRfZ3JvdXArMHgxMS8weDExPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43NDgy
MzZdwqAgWyZsdDs4MTAwMGUwYiZndDtdIGRvX2ludDgwX3N5c2NhbGxfMzIrMHg0My8weDU1PGJy
IGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43NDg5MDldwqAgWyZsdDs4MTJiODkxMSZndDtd
IGVudHJ5X0lOVDgwXzMyKzB4MzEvMHgzMTxiciBjbGFzcz0iZ21haWxfbXNnIj4KW8KgIMKgMjMu
NzQ5NTAzXSBDb2RlOiA4OSBjZiA2OCA0MyA2NiAzZCA4MSBlOCAxZSA5YSAwNSAwMCA1NyA1NiA2
OCA2MCA2NiAzZCA4MSBlOCAxMiA5YSAwNSAwMCA2NCA4YiAwZCBkYyA4YSA0ZiA4MSBiYSA3MiA2
NiAzZCA4MSA4OSBkOCBlOCBhYyBmZSBmZiBmZiAmbHQ7MGYmZ3Q7IDBiIDgxIDc4IDBjIDY0IDY1
IDczIDQzIDc0IDA4IDU1IDg5IGU1IGU4IGI4IGZmIGZmIGZmIGMzIDU1PGJyIGNsYXNzPSJnbWFp
bF9tc2ciPgpbwqAgwqAyMy43NTMwMzJdIEVJUDogWyZsdDs4MTA0Y2FkOCZndDtdIF9faW52YWxp
ZF9jcmVkcysweDM1LzB4MzcgU1M6RVNQIDAwNjg6OGM0OGRlYjg8YnIgY2xhc3M9ImdtYWlsX21z
ZyI+ClvCoCDCoDIzLjc1Mzk3MV0gLS0tWyBlbmQgdHJhY2UgZTQ2YTgyYmU1NWMwNTkxMyBdLS0t
PGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpbwqAgwqAyMy43NTQ4OTRdIEJVRzogdW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0wqAgwqAobnVsbCk8YnIgY2xh
c3M9ImdtYWlsX21zZyI+CjxiciBjbGFzcz0iZ21haWxfbXNnIj4KPGJyIGNsYXNzPSJnbWFpbF9t
c2ciPgo8YnIgY2xhc3M9ImdtYWlsX21zZyI+CjxiciBjbGFzcz0iZ21haWxfbXNnIj4KPGJyIGNs
YXNzPSJnbWFpbF9tc2ciPgpUaGFua3MsPGJyIGNsYXNzPSJnbWFpbF9tc2ciPgpLZXJuZWwgVGVz
dCBSb2JvdDxiciBjbGFzcz0iZ21haWxfbXNnIj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============2358269533138540613==--

