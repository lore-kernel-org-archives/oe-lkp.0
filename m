Content-Type: multipart/mixed; boundary="===============7250904896276091929=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [mailbox] afd0b1fb22: kmsg.Error_parsing_PCC_subspaces_from_PCCT
Date: Wed, 10 Oct 2018 16:36:57 +0800
Message-ID: <6f7dfa1a-20b9-8109-d585-cee63fd1eec7@intel.com>
In-Reply-To: <639587bc-bbdc-8ff4-6e3d-7ef4c0a4a034@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7250904896276091929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 10/02/2018 08:06 PM, David Arcari wrote:
> Hi,
>
> Can someone help me interpret this email?  I was expecting this to be abo=
ut a
> dmesg change which is expected, but the content doesn't seem to indicate =
that.
>
> For the record, the commit shouldn't really introduce any functional chan=
ges.
> It merely avoids calling kcalloc with count=3D=3D-EINVAL.  In both cases,=
 an error
> should be returned from  acpi_pcc_probe to pcc_init, which should in turn=
 always
> return -ENODEV.
>
> So with the commit in place, this would be logged:
>
> [    3.957345] ACPI: [PCCT:0x00] Invalid zero length
> [    3.962340] Error parsing PCC subspaces from PCCT
>
> instead of:
>
> [    3.957345] ACPI: [PCCT:0x00] Invalid zero length
> [    3.962340] Could not allocate space for PCC mbox channels
Thanks for the explanation, robot found an new error is from this commit,
but it may not make sense.=C2=A0 please ignore this report.

Best Regards,
Rong Chen

>
> On 09/29/2018 11:17 PM, kernel test robot wrote:
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: afd0b1fb22269f48d68fdf269891c653818c8047 ("mailbox: PCC: handle =
parse error")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> in testcase: ftq
>> with following parameters:
>>
>> 	nr_task: 100%
>> 	samples: 6000ss
>> 	test: cache
>> 	freq: 20
>> 	ucode: 0x200004d
>> 	cpufreq_governor: performance
>>
>> test-description: The FTQ benchmarks measure hardware and software inter=
ference or 'noise' on a node from the applications perspective.
>> test-url: https://github.com/rminnich/ftq
>>
>>
>> on test machine: 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.10GH=
z with 192G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> 2018-09-21 23:31:26 ./ftq_cache -f 20 -n 6000 -t 104 -a 360448
>> ticks per ns 2.09508
> This ^^^ appears to be the actual error, but I don't understand what the
> expected result should be or what this really means.
>
> Thanks,
>
> -Dave
>
>
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install job.yaml  # job file is attached in this email
>>          bin/lkp run     job.yaml
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============7250904896276091929==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHA+PGJyPgogICAgPC9wPgogICAgPGJyPgog
ICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAxMC8wMi8yMDE4IDA4OjA2IFBNLCBE
YXZpZCBBcmNhcmkKICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6NjM5NTg3YmMtYmJkYy04ZmY0LTZlM2QtN2VmNGMw
YTRhMDM0QHJlZGhhdC5jb20iPgogICAgICA8cHJlIHdyYXA9IiI+CkhpLAoKQ2FuIHNvbWVvbmUg
aGVscCBtZSBpbnRlcnByZXQgdGhpcyBlbWFpbD8gIEkgd2FzIGV4cGVjdGluZyB0aGlzIHRvIGJl
IGFib3V0IGEKZG1lc2cgY2hhbmdlIHdoaWNoIGlzIGV4cGVjdGVkLCBidXQgdGhlIGNvbnRlbnQg
ZG9lc24ndCBzZWVtIHRvIGluZGljYXRlIHRoYXQuCgpGb3IgdGhlIHJlY29yZCwgdGhlIGNvbW1p
dCBzaG91bGRuJ3QgcmVhbGx5IGludHJvZHVjZSBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzLgpJdCBt
ZXJlbHkgYXZvaWRzIGNhbGxpbmcga2NhbGxvYyB3aXRoIGNvdW50PT0tRUlOVkFMLiAgSW4gYm90
aCBjYXNlcywgYW4gZXJyb3IKc2hvdWxkIGJlIHJldHVybmVkIGZyb20gIGFjcGlfcGNjX3Byb2Jl
IHRvIHBjY19pbml0LCB3aGljaCBzaG91bGQgaW4gdHVybiBhbHdheXMKcmV0dXJuIC1FTk9ERVYu
CgpTbyB3aXRoIHRoZSBjb21taXQgaW4gcGxhY2UsIHRoaXMgd291bGQgYmUgbG9nZ2VkOgoKWyAg
ICAzLjk1NzM0NV0gQUNQSTogW1BDQ1Q6MHgwMF0gSW52YWxpZCB6ZXJvIGxlbmd0aApbICAgIDMu
OTYyMzQwXSBFcnJvciBwYXJzaW5nIFBDQyBzdWJzcGFjZXMgZnJvbSBQQ0NUCgppbnN0ZWFkIG9m
OgoKWyAgICAzLjk1NzM0NV0gQUNQSTogW1BDQ1Q6MHgwMF0gSW52YWxpZCB6ZXJvIGxlbmd0aApb
ICAgIDMuOTYyMzQwXSBDb3VsZCBub3QgYWxsb2NhdGUgc3BhY2UgZm9yIFBDQyBtYm94IGNoYW5u
ZWxzCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHNwYW4gaWQ9IndfMTAiIGNsYXNzPSIi
PlRoYW5rcyA8L3NwYW4+PHNwYW4gaWQ9IndfMTEiIGNsYXNzPSIiPmZvcgogICAgPC9zcGFuPjxz
cGFuIGlkPSJ3XzEyIiBjbGFzcz0iIj50aGUgPC9zcGFuPjxzcGFuIGlkPSJ3XzEzIiBjbGFzcz0i
Ij5leHBsYW5hdGlvbjwvc3Bhbj48c3BhbgogICAgICBpZD0id18xNCIgY2xhc3M9IiI+LCByb2Jv
dCBmb3VuZCBhbiBuZXcgZXJyb3IgaXMgZnJvbSB0aGlzIGNvbW1pdCwKICAgICAgPGJyPgogICAg
ICBidXQgaXQgbWF5IG5vdCBtYWtlIHNlbnNlLsKgIHBsZWFzZSBpZ25vcmUgdGhpcyByZXBvcnQu
PGJyPgogICAgICA8YnI+CiAgICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICAgIFJvbmcgQ2hlbjxi
cj4KICAgICAgPGJyPgogICAgPC9zcGFuPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAg
ICAgY2l0ZT0ibWlkOjYzOTU4N2JjLWJiZGMtOGZmNC02ZTNkLTdlZjRjMGE0YTAzNEByZWRoYXQu
Y29tIj4KICAgICAgPHByZSB3cmFwPSIiPgoKT24gMDkvMjkvMjAxOCAxMToxNyBQTSwga2VybmVs
IHRlc3Qgcm9ib3Qgd3JvdGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4K
ICAgICAgICA8cHJlIHdyYXA9IiI+RllJLCB3ZSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgY29tbWl0
IChidWlsdCB3aXRoIGdjYy03KToKCmNvbW1pdDogYWZkMGIxZmIyMjI2OWY0OGQ2OGZkZjI2OTg5
MWM2NTM4MThjODA0NyAoIm1haWxib3g6IFBDQzogaGFuZGxlIHBhcnNlIGVycm9yIikKPGEgY2xh
c3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVsLm9yZy9j
Z2l0L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdCI+aHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdDwvYT4gbWFz
dGVyCgppbiB0ZXN0Y2FzZTogZnRxCndpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6CgoJbnJfdGFz
azogMTAwJQoJc2FtcGxlczogNjAwMHNzCgl0ZXN0OiBjYWNoZQoJZnJlcTogMjAKCXVjb2RlOiAw
eDIwMDAwNGQKCWNwdWZyZXFfZ292ZXJub3I6IHBlcmZvcm1hbmNlCgp0ZXN0LWRlc2NyaXB0aW9u
OiBUaGUgRlRRIGJlbmNobWFya3MgbWVhc3VyZSBoYXJkd2FyZSBhbmQgc29mdHdhcmUgaW50ZXJm
ZXJlbmNlIG9yICdub2lzZScgb24gYSBub2RlIGZyb20gdGhlIGFwcGxpY2F0aW9ucyBwZXJzcGVj
dGl2ZS4KdGVzdC11cmw6IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9ybWlubmljaC9mdHEiPmh0dHBzOi8vZ2l0aHViLmNvbS9ybWlubmlj
aC9mdHE8L2E+CgoKb24gdGVzdCBtYWNoaW5lOiAxMDQgdGhyZWFkcyBJbnRlbChSKSBYZW9uKFIp
IFBsYXRpbnVtIDgxNzAgQ1BVIEAgMi4xMEdIeiB3aXRoIDE5MkcgbWVtb3J5CgpjYXVzZWQgYmVs
b3cgY2hhbmdlcyAocGxlYXNlIHJlZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGly
ZSBsb2cvYmFja3RyYWNlKToKCgoKCjIwMTgtMDktMjEgMjM6MzE6MjYgLi9mdHFfY2FjaGUgLWYg
MjAgLW4gNjAwMCAtdCAxMDQgLWEgMzYwNDQ4CnRpY2tzIHBlciBucyAyLjA5NTA4CjwvcHJlPgog
ICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0iIj4KVGhpcyBeXl4gYXBwZWFycyB0
byBiZSB0aGUgYWN0dWFsIGVycm9yLCBidXQgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgdGhlCmV4
cGVjdGVkIHJlc3VsdCBzaG91bGQgYmUgb3Igd2hhdCB0aGlzIHJlYWxseSBtZWFucy4KClRoYW5r
cywKCi1EYXZlCgoKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAg
IDxwcmUgd3JhcD0iIj4KCgpUbyByZXByb2R1Y2U6CgogICAgICAgIGdpdCBjbG9uZSA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwv
bGtwLXRlc3RzLmdpdCI+aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+
CiAgICAgICAgY2QgbGtwLXRlc3RzCiAgICAgICAgYmluL2xrcCBpbnN0YWxsIGpvYi55YW1sICAj
IGpvYiBmaWxlIGlzIGF0dGFjaGVkIGluIHRoaXMgZW1haWwKICAgICAgICBiaW4vbGtwIHJ1biAg
ICAgam9iLnlhbWwKCgoKVGhhbmtzLApSb25nIENoZW4KCjwvcHJlPgogICAgICA8L2Jsb2NrcXVv
dGU+CiAgICAgIDxwcmUgd3JhcD0iIj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFi
YnJldmlhdGVkIiBocmVmPSJtYWlsdG86TEtQQGxpc3RzLjAxLm9yZyI+TEtQQGxpc3RzLjAxLm9y
ZzwvYT4KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0
cy4wMS5vcmcvbWFpbG1hbi9saXN0aW5mby9sa3AiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxt
YW4vbGlzdGluZm8vbGtwPC9hPgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICA8
L2JvZHk+CjwvaHRtbD4K

--===============7250904896276091929==--

