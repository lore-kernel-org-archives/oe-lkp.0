Content-Type: multipart/mixed; boundary="===============7759902834049588590=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] Revert "i2c: dev: switch from register_chrdev to cdev API"
Date: Mon, 30 May 2016 10:05:47 +0300
Message-ID: <20160530070547.GA18199@mwanda>
In-Reply-To: <20160528160458.GA1614@katana>
List-Id: <oe-lkp.lists.linux.dev>

--===============7759902834049588590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2016 at 06:04:58PM +0200, Wolfram Sang wrote:
> =

> > These kinds of use after frees don't always cause a runtime problem.  I
> > found it using static analysis, but I bet you could detect it if you
> > enabled kasan.  The other option is to enable PAGE_POISONING?
> =

> Thanks, PAGE_POISONING did trigger the issue. So, I now picked up your
> patch instead of the revert because I could verify the problem and the
> proper solution. Thanks again.
> =

> What I still wonder: Which analysis reported the problem to you? I
> always run sparse, smatch, cppcheck, and coccicheck on the patches when
> applying and no-one reported the issue.

It's a Smatch warning but you have to build the cross function db to
detect this.  It takes a while (a few hours) but the command is simple
enough.

	./smatch_scripts/build_kernel_data.sh

regards,
dan carpenter


--===============7759902834049588590==--

