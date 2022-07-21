Content-Type: multipart/mixed; boundary="===============0251853695974433833=="
MIME-Version: 1.0
From: jim.cromie@gmail.com
To: lkp@lists.01.org
Subject: Re: [drm] 39dec70a06: leaking-addresses.proc._dyndbg_classes.
Date: Thu, 21 Jul 2022 12:12:47 -0600
Message-ID: <CAJfuBxw5QVOM6Tp6KT6OrcSaHWO_+bQsKS_W3Anb9vOOye=7OQ@mail.gmail.com>
In-Reply-To: <YtimUGVxhkIRhmte@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0251853695974433833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022 at 7:05 PM kernel test robot <oliver.sang@intel.com>
wrote:

>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 39dec70a061e581e60adb416031948ecd2dcd5d0 ("drm: POC drm on dyndbg
> - use in core, 2 helpers, 3 drivers.")
> https://github.com/jimc/linux.git dyn-drm-trc
>
> in testcase: leaking-addresses
> version: leaking-addresses-x86_64-4f19048-1_20220518
> with following parameters:
>
>         ucode: 0x28
>
>
>
> on test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @
> 3.40GHz with 16G memory
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
>
> below (1) is not observed on parent tests:
>




>
>
> 2022-07-18 02:55:06 ./leaking_addresses.pl --output-raw result/scan.out
> 2022-07-18 02:55:30 ./leaking_addresses.pl --input-raw result/scan.out
> --squash-by-filename
>
> Total number of results from scan (incl dmesg): 168569
>
> dmesg output:
> [    2.186392] mapped IOAPIC to ffffffffff5fb000 (fec00000)
>
> Results squashed by filename (excl dmesg). Displaying [<number of results>
> <filename>], <example result>
>

new section, populated by macro invocations in this patch

[3 __dyndbg_classes] 0xffffffffc08dad00        <----- (1)
> [18 __dyndbg] 0xffffffffc01fd4e0
>

So I think this is All-good.


>

--===============0251853695974433833==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgSnVs
IDIwLCAyMDIyIGF0IDc6MDUgUE0ga2VybmVsIHRlc3Qgcm9ib3QgJmx0OzxhIGhyZWY9Im1haWx0
bzpvbGl2ZXIuc2FuZ0BpbnRlbC5jb20iPm9saXZlci5zYW5nQGludGVsLmNvbTwvYT4mZ3Q7IHdy
b3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJn
aW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIw
NCk7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgo8YnI+CkdyZWV0aW5nLDxicj4KPGJyPgpGWUksIHdl
IG5vdGljZWQgdGhlIGZvbGxvd2luZyBjb21taXQgKGJ1aWx0IHdpdGggZ2NjLTExKTo8YnI+Cjxi
cj4KY29tbWl0OiAzOWRlYzcwYTA2MWU1ODFlNjBhZGI0MTYwMzE5NDhlY2QyZGNkNWQwICgmcXVv
dDtkcm06IFBPQyBkcm0gb24gZHluZGJnIC0gdXNlIGluIGNvcmUsIDIgaGVscGVycywgMyBkcml2
ZXJzLiZxdW90Oyk8YnI+CjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9qaW1jL2xpbnV4Lmdp
dCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXRodWIuY29tL2pp
bWMvbGludXguZ2l0PC9hPiBkeW4tZHJtLXRyYzxicj4KPGJyPgppbiB0ZXN0Y2FzZTogbGVha2lu
Zy1hZGRyZXNzZXM8YnI+CnZlcnNpb246IGxlYWtpbmctYWRkcmVzc2VzLXg4Nl82NC00ZjE5MDQ4
LTFfMjAyMjA1MTg8YnI+CndpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6PGJyPgo8YnI+CsKgIMKg
IMKgIMKgIHVjb2RlOiAweDI4PGJyPgo8YnI+Cjxicj4KPGJyPgpvbiB0ZXN0IG1hY2hpbmU6IDgg
dGhyZWFkcyAxIHNvY2tldHMgSW50ZWwoUikgQ29yZShUTSkgaTctNDc3MCBDUFUgQCAzLjQwR0h6
IHdpdGggMTZHIG1lbW9yeTxicj4KPGJyPgpjYXVzZWQgYmVsb3cgY2hhbmdlcyAocGxlYXNlIHJl
ZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGlyZSBsb2cvYmFja3RyYWNlKTo8YnI+
Cjxicj4KPGJyPgo8YnI+Cjxicj4KSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9s
bG93aW5nIHRhZzxicj4KUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90ICZsdDs8YSBocmVm
PSJtYWlsdG86b2xpdmVyLnNhbmdAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+b2xpdmVyLnNh
bmdAaW50ZWwuY29tPC9hPiZndDs8YnI+Cjxicj4KPGJyPgpiZWxvdyAoMSkgaXMgbm90IG9ic2Vy
dmVkIG9uIHBhcmVudCB0ZXN0czo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+Cjxicj4KPGJyPgoyMDIyLTA3LTE4IDAyOjU1
OjA2IC4vPGEgaHJlZj0iaHR0cDovL2xlYWtpbmdfYWRkcmVzc2VzLnBsIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5sZWFraW5nX2FkZHJlc3Nlcy5wbDwvYT4gLS1vdXRwdXQtcmF3
IHJlc3VsdC9zY2FuLm91dDxicj4KMjAyMi0wNy0xOCAwMjo1NTozMCAuLzxhIGhyZWY9Imh0dHA6
Ly9sZWFraW5nX2FkZHJlc3Nlcy5wbCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+
bGVha2luZ19hZGRyZXNzZXMucGw8L2E+IC0taW5wdXQtcmF3IHJlc3VsdC9zY2FuLm91dCAtLXNx
dWFzaC1ieS1maWxlbmFtZTxicj4KPGJyPgpUb3RhbCBudW1iZXIgb2YgcmVzdWx0cyBmcm9tIHNj
YW4gKGluY2wgZG1lc2cpOiAxNjg1Njk8YnI+Cjxicj4KZG1lc2cgb3V0cHV0Ojxicj4KW8KgIMKg
IDIuMTg2MzkyXSBtYXBwZWQgSU9BUElDIHRvIGZmZmZmZmZmZmY1ZmIwMDAgKGZlYzAwMDAwKTxi
cj4KPGJyPgpSZXN1bHRzIHNxdWFzaGVkIGJ5IGZpbGVuYW1lIChleGNsIGRtZXNnKS4gRGlzcGxh
eWluZyBbJmx0O251bWJlciBvZiByZXN1bHRzJmd0OyAmbHQ7ZmlsZW5hbWUmZ3Q7XSwgJmx0O2V4
YW1wbGUgcmVzdWx0Jmd0Ozxicj4KPC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+bmV3
IHNlY3Rpb24sIHBvcHVsYXRlZCBieSBtYWNybyBpbnZvY2F0aW9ucyBpbiB0aGlzIHBhdGNoPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIw
NCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPlszIF9fZHluZGJnX2NsYXNzZXNdIDB4ZmZmZmZmZmZj
MDhkYWQwMMKgIMKgIMKgIMKgICZsdDstLS0tLSAoMSk8YnI+WzE4IF9fZHluZGJnXSAweGZmZmZm
ZmZmYzAxZmQ0ZTA8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+U28gSSB0aGlu
ayB0aGlzIGlzIEFsbC1nb29kLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48YmxvY2txdW90ZSBj
bGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVy
LWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGJyPgo8
L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+Cg==

--===============0251853695974433833==--

