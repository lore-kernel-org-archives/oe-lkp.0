Content-Type: multipart/mixed; boundary="===============5212166221079763764=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xarray] 0e9446c35a: WARNING:at_include/linux/xarray.h:#xa_mk_value
Date: Mon, 05 Nov 2018 09:57:47 -0800
Message-ID: <CAHk-=wgHY5EdhvPoS458Wu8iUfC9C8UBG8GzEO72=0prT2nVcw@mail.gmail.com>
In-Reply-To: <20181105070337.GX24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5212166221079763764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Willy,

On Sun, Nov 4, 2018 at 11:03 PM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> commit: 0e9446c35a80931044b6d8d2d74a9cabd248539f ("xarray: Add range stor=
e functionality")
...
> [   11.880031] WARNING: CPU: 0 PID: 1 at include/linux/xarray.h:54 xa_mk_=
value+0x7/0x10
> [   11.881944] EIP: xa_mk_value+0x7/0x10
> [   11.883565] Call Trace:
> [   11.883565]  __check_store_range+0xe/0x171
> [   11.883565]  check_store_range+0x5d/0x87

If I read this right, it's simply this case:

                __check_store_range(xa, UINT_MAX + i, UINT_MAX + j);

which turns into negative values on a 32-bit machine, and then
xa_mk_value() warns.

Should that part of the test be surrounded by #ifdef CONFIG_64BIT? Or
did you _want_ the warnings?

                 Linus

--===============5212166221079763764==--

