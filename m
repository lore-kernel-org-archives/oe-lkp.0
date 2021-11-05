Content-Type: multipart/mixed; boundary="===============1820418994812738477=="
MIME-Version: 1.0
From: Ian Rogers <irogers@google.com>
To: lkp@lists.01.org
Subject: Re: [perf metrics] 5ecd5a0c7d: perf-sanity-tests.Parse_and_process_metrics.fail
Date: Fri, 05 Nov 2021 00:27:18 -0700
Message-ID: <CAP-5=fUL0fdZ1q+08AFWvVQ1WDo7jnHqofDQBLNdKD4Nvg8x=g@mail.gmail.com>
In-Reply-To: <20211105051142.GC16759@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1820418994812738477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is an asan run and I believe there is a memory leak introduced by my
change, so the test failures are a memory leak and nothing more serious -
not clear in the logs here. I'll work on a fix.

Thanks,
Ian

On Thu, Nov 4, 2021 at 10:11 PM kernel test robot <oliver.sang@intel.com>
wrote:

>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 5ecd5a0c7d1cca79f1431093d12e4cd9893b0331 ("perf metrics: Modify
> setup and deduplication")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: perf-sanity-tests
> version: perf-x86_64-cc0356d6a02e-1_20211102
> with following parameters:
>
>         perf_compiler: gcc
>         ucode: 0xde
>
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @
> 3.60GHz with 32G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
> 2021-11-04 13:27:18 sudo
> /usr/src/perf_selftests-x86_64-rhel-8.3-func-5ecd5a0c7d1cca79f1431093d12e=
4cd9893b0331/tools/perf/perf
> test 68
> 68: Parse and process metrics                                       :
> FAILED!
>
> >>> another failed test but can pass on parent
> 2021-11-04 13:27:18 sudo
> /usr/src/perf_selftests-x86_64-rhel-8.3-func-5ecd5a0c7d1cca79f1431093d12e=
4cd9893b0331/tools/perf/perf
> test 70
> 70: Event expansion for cgroups                                     :
> FAILED!
>
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in
> this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file
> for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology
> Center
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel
> Corporation
>
> Thanks,
> Oliver Sang
>
>

--===============1820418994812738477==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+VGhpcyBpcyBhbiBhc2FuIHJ1biBhbmQgSSBiZWxpZXZlIHRoZXJlIGlz
IGEgbWVtb3J5IGxlYWsgaW50cm9kdWNlZCBieSBteSBjaGFuZ2UsIHNvIHRoZSB0ZXN0IGZhaWx1
cmVzIGFyZSBhIG1lbW9yeSBsZWFrwqBhbmQgbm90aGluZyBtb3JlIHNlcmlvdXPCoC0gbm90IGNs
ZWFyIGluIHRoZSBsb2dzIGhlcmUuIEkmIzM5O2xsIHdvcmsgb24gYSBmaXguPGRpdj48YnI+PC9k
aXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5JYW48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIE5v
diA0LCAyMDIxIGF0IDEwOjExIFBNIGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVmPSJtYWls
dG86b2xpdmVyLnNhbmdAaW50ZWwuY29tIj5vbGl2ZXIuc2FuZ0BpbnRlbC5jb208L2E+Jmd0OyB3
cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPjxicj4KPGJyPgpHcmVldGluZyw8YnI+Cjxicj4KRllJLCB3
ZSBub3RpY2VkIHRoZSBmb2xsb3dpbmcgY29tbWl0IChidWlsdCB3aXRoIGdjYy05KTo8YnI+Cjxi
cj4KY29tbWl0OiA1ZWNkNWEwYzdkMWNjYTc5ZjE0MzEwOTNkMTJlNGNkOTg5M2IwMzMxICgmcXVv
dDtwZXJmIG1ldHJpY3M6IE1vZGlmeSBzZXR1cCBhbmQgZGVkdXBsaWNhdGlvbiZxdW90Oyk8YnI+
CjxhIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L25l
eHQvbGludXgtbmV4dC5naXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5n
aXQ8L2E+IG1hc3Rlcjxicj4KPGJyPgppbiB0ZXN0Y2FzZTogcGVyZi1zYW5pdHktdGVzdHM8YnI+
CnZlcnNpb246IHBlcmYteDg2XzY0LWNjMDM1NmQ2YTAyZS0xXzIwMjExMTAyPGJyPgp3aXRoIGZv
bGxvd2luZyBwYXJhbWV0ZXJzOjxicj4KPGJyPgrCoCDCoCDCoCDCoCBwZXJmX2NvbXBpbGVyOiBn
Y2M8YnI+CsKgIMKgIMKgIMKgIHVjb2RlOiAweGRlPGJyPgo8YnI+Cjxicj4KPGJyPgpvbiB0ZXN0
IG1hY2hpbmU6IDggdGhyZWFkcyAxIHNvY2tldHMgSW50ZWwoUikgQ29yZShUTSkgaTctNzcwMCBD
UFUgQCAzLjYwR0h6IHdpdGggMzJHIG1lbW9yeTxicj4KPGJyPgpjYXVzZWQgYmVsb3cgY2hhbmdl
cyAocGxlYXNlIHJlZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGlyZSBsb2cvYmFj
a3RyYWNlKTo8YnI+Cjxicj4KPGJyPgo8YnI+Cjxicj4KSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtp
bmRseSBhZGQgZm9sbG93aW5nIHRhZzxicj4KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90
ICZsdDs8YSBocmVmPSJtYWlsdG86b2xpdmVyLnNhbmdAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+b2xpdmVyLnNhbmdAaW50ZWwuY29tPC9hPiZndDs8YnI+Cjxicj4KMjAyMS0xMS0wNCAxMzoy
NzoxOCBzdWRvIC91c3Ivc3JjL3BlcmZfc2VsZnRlc3RzLXg4Nl82NC1yaGVsLTguMy1mdW5jLTVl
Y2Q1YTBjN2QxY2NhNzlmMTQzMTA5M2QxMmU0Y2Q5ODkzYjAzMzEvdG9vbHMvcGVyZi9wZXJmIHRl
c3QgNjg8YnI+CjY4OiBQYXJzZSBhbmQgcHJvY2VzcyBtZXRyaWNzwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IEZBSUxFRCE8YnI+Cjxi
cj4KJmd0OyZndDsmZ3Q7IGFub3RoZXIgZmFpbGVkIHRlc3QgYnV0IGNhbiBwYXNzIG9uIHBhcmVu
dDxicj4KMjAyMS0xMS0wNCAxMzoyNzoxOCBzdWRvIC91c3Ivc3JjL3BlcmZfc2VsZnRlc3RzLXg4
Nl82NC1yaGVsLTguMy1mdW5jLTVlY2Q1YTBjN2QxY2NhNzlmMTQzMTA5M2QxMmU0Y2Q5ODkzYjAz
MzEvdG9vbHMvcGVyZi9wZXJmIHRlc3QgNzA8YnI+CjcwOiBFdmVudCBleHBhbnNpb24gZm9yIGNn
cm91cHPCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDogRkFJTEVEITxicj4KPGJyPgo8YnI+Cjxicj4KVG8gcmVwcm9kdWNlOjxicj4KPGJyPgrC
oCDCoCDCoCDCoCBnaXQgY2xvbmUgPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xr
cC10ZXN0cy5naXQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0
aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMuZ2l0PC9hPjxicj4KwqAgwqAgwqAgwqAgY2QgbGtwLXRl
c3RzPGJyPgrCoCDCoCDCoCDCoCBzdWRvIGJpbi9sa3AgaW5zdGFsbCBqb2IueWFtbMKgIMKgIMKg
IMKgIMKgIMKgIyBqb2IgZmlsZSBpcyBhdHRhY2hlZCBpbiB0aGlzIGVtYWlsPGJyPgrCoCDCoCDC
oCDCoCBiaW4vbGtwIHNwbGl0LWpvYiAtLWNvbXBhdGlibGUgam9iLnlhbWwgIyBnZW5lcmF0ZSB0
aGUgeWFtbCBmaWxlIGZvciBsa3AgcnVuPGJyPgrCoCDCoCDCoCDCoCBzdWRvIGJpbi9sa3AgcnVu
IGdlbmVyYXRlZC15YW1sLWZpbGU8YnI+Cjxicj4KwqAgwqAgwqAgwqAgIyBpZiBjb21lIGFjcm9z
cyBhbnkgZmFpbHVyZSB0aGF0IGJsb2NrcyB0aGUgdGVzdCw8YnI+CsKgIMKgIMKgIMKgICMgcGxl
YXNlIHJlbW92ZSB+Ly5sa3AgYW5kIC9sa3AgZGlyIHRvIHJ1biBmcm9tIGEgY2xlYW4gc3RhdGUu
PGJyPgo8YnI+Cjxicj4KPGJyPgotLS08YnI+CjBEQVkvTEtQKyBUZXN0IEluZnJhc3RydWN0dXJl
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRl
cjxicj4KPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0eS9saXN0L2xrcEBs
aXN0cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlz
dHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9sa3BAbGlzdHMuMDEub3JnPC9hPsKgIMKgIMKgIMKg
SW50ZWwgQ29ycG9yYXRpb248YnI+Cjxicj4KVGhhbmtzLDxicj4KT2xpdmVyIFNhbmc8YnI+Cjxi
cj4KPC9ibG9ja3F1b3RlPjwvZGl2Pgo=

--===============1820418994812738477==--

