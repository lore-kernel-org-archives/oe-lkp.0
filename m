Content-Type: multipart/mixed; boundary="===============1492562615181606206=="
MIME-Version: 1.0
From: Alexei Starovoitov <ast@plumgrid.com>
To: lkp@lists.01.org
Subject: Re: [net: sock] BUG: unable to handle kernel NULL pointer dereference at 0000000000000007
Date: Wed, 10 Dec 2014 15:51:33 -0800
Message-ID: <CAMEtUuxexMXtvK_R7YZEvx_iyK9mAx_zrqr1bkj3PsUwoq0p5A@mail.gmail.com>
In-Reply-To: <20141210232911.GE24163@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1492562615181606206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 3:29 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
>     net: sock: allow eBPF programs to be attached to sockets

> [init] Kernel was tainted on startup. Will ignore flags that are already =
set.
> [init] Started watchdog process, PID is 9354
> [main] Main thread is alive.
> [   21.233581] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000007
> [   21.234709] IP: [<ffffffff8156ebda>] sk_attach_bpf+0x39/0xc2

thanks for the report! syscall fuzzer is great.
I missed an extra check. Working on a fix.

--===============1492562615181606206==--

