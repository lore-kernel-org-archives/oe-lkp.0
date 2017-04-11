Content-Type: multipart/mixed; boundary="===============1529094588013346126=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Tue, 11 Apr 2017 10:46:35 +0900
Message-ID: <20170411014635.GA3836@jagdpanzerIV.localdomain>
In-Reply-To: <20170410184858.GA24226@amd>
List-Id: <oe-lkp.lists.linux.dev>

--===============1529094588013346126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (04/10/17 20:48), Pavel Machek wrote:
[..]
> > but, once again, I see your point.
> =

> Good. Does that mean that the next version of patches will work ok in
> that case?

yes.

we also likely will get rid of printk_begin/end in PM code.
but we still need to have printk_emergency hints from the
outside world in the rest of the places (sysrq etc.)    :(

	-ss

--===============1529094588013346126==--

