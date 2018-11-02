Content-Type: multipart/mixed; boundary="===============3924758283902384922=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: 6e01f5c16f [ 136.269389] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [trinity-c1:629]
Date: Thu, 01 Nov 2018 17:04:24 -0700
Message-ID: <20181102000424.GP10491@bombadil.infradead.org>
In-Reply-To: <20181101011605.GY24195@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============3924758283902384922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 09:16:05AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.infradead.org/users/willy/linux-dax.git xarray-conv
> =

> commit 6e01f5c16f795c4bc071bf15b64ed89e63dfd484

Thank you.  I tracked down this bug with the aid of your reproduction
scripts and fixed it.

--===============3924758283902384922==--

