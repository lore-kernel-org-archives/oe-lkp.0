Content-Type: multipart/mixed; boundary="===============6138532812646800562=="
MIME-Version: 1.0
From: David Carrillo-Cisneros <davidcc@google.com>
To: lkp@lists.01.org
Subject: Re: [perf/core] 412929295f: WARNING: CPU: 2 PID: 600 at kernel/events/core.c:3530 perf_event_read+0x17d/0x190
Date: Sun, 09 Oct 2016 07:58:59 +0000
Message-ID: <CALcN6mi_FN563ZUJohVu9E13wsnySaMNJdvEa4QoyD1DvxbKAQ@mail.gmail.com>
In-Reply-To: <20161009070929.GD5609@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6138532812646800562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>
>
> FYI, we noticed the following commit:
>
>
> https://github.com/0day-ci/linux
> David-Carrillo-Cisneros/remove-unnecessary-IPI-reading-uncore-events/2016=
0818-045857
>
> commit 412929295ff670aa6890e346e2fc05f58d93cd96 ("perf/core: check return
> value of perf_event_read IPI")
>
> Hi Xiaolong,

The problem was discussed following the submission:
https://lkml.org/lkml/2016/8/21/58

and it was decided to revert the WARN_ON and purposely ignore the error in
smp_call_function_single:
http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?id=3D587631=
48758057ffc447bf990321d3ea86d199a0

David

--===============6138532812646800562==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAj
Y2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxicj5GWUksIHdlIG5vdGljZWQgdGhlIGZvbGxv
d2luZyBjb21taXQ6PGJyIGNsYXNzPSJnbWFpbF9tc2ciPjxicj48YnI+PGEgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgiIHJlbD0ibm9yZWZlcnJlciIgY2xhc3M9ImdtYWls
X21zZyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4PC9h
PiBEYXZpZC1DYXJyaWxsby1DaXNuZXJvcy9yZW1vdmUtdW5uZWNlc3NhcnktSVBJLXJlYWRpbmct
dW5jb3JlLWV2ZW50cy8yMDE2MDgxOC0wNDU4NTc8YnIgY2xhc3M9ImdtYWlsX21zZyI+PGJyPmNv
bW1pdCA0MTI5MjkyOTVmZjY3MGFhNjg5MGUzNDZlMmZjMDVmNThkOTNjZDk2ICgmcXVvdDtwZXJm
L2NvcmU6IGNoZWNrIHJldHVybiB2YWx1ZSBvZiBwZXJmX2V2ZW50X3JlYWQgSVBJJnF1b3Q7KTxi
ciBjbGFzcz0iZ21haWxfbXNnIj48YnI+PC9ibG9ja3F1b3RlPjxkaXY+SGkgWGlhb2xvbmcsPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGUgcHJvYmxlbSB3YXMgZGlzY3Vzc2VkIGZvbGxvd2lu
ZyB0aGUgc3VibWlzc2lvbjo8L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDE2LzgvMjEvNTgiPmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE2LzgvMjEvNTg8L2E+PGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PmFuZCBpdCB3YXMgZGVjaWRlZCB0byByZXZlcnQgdGhlIFdB
Uk5fT04gYW5kIHB1cnBvc2VseSBpZ25vcmUgdGhlIGVycm9yIGluIHNtcF9jYWxsX2Z1bmN0aW9u
X3NpbmdsZTrCoDxiciBjbGFzcz0iaW5ib3gtaW5ib3gtQXBwbGUtaW50ZXJjaGFuZ2UtbmV3bGlu
ZSI+PGEgaHJlZj0iaHR0cDovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC90
aXAvdGlwLmdpdC9jb21taXQvP2lkPTU4NzYzMTQ4NzU4MDU3ZmZjNDQ3YmY5OTAzMjFkM2VhODZk
MTk5YTAiPmh0dHA6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdGlwL3Rp
cC5naXQvY29tbWl0Lz9pZD01ODc2MzE0ODc1ODA1N2ZmYzQ0N2JmOTkwMzIxZDNlYTg2ZDE5OWEw
PC9hPjxicj48YnI+RGF2aWQ8YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxiciBjbGFzcz0i
aW5ib3gtaW5ib3gtQXBwbGUtaW50ZXJjaGFuZ2UtbmV3bGluZSI+PC9kaXY+PGRpdj7CoDwvZGl2
PjwvZGl2PjwvZGl2Pgo=

--===============6138532812646800562==--

