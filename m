Content-Type: multipart/mixed; boundary="===============8566269795929861653=="
MIME-Version: 1.0
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: lkp@lists.01.org
Subject: Re: [i2c] 95026658c4: WARNING: CPU: 0 PID: 1 at drivers/i2c/i2c-core.c:1930 i2c_register_driver+0x2c/0x79()
Date: Mon, 14 Mar 2016 19:45:19 +0530
Message-ID: <20160314141519.GA5699@sudip-laptop>
In-Reply-To: <20160314011419.GA2308@katana>
List-Id: <oe-lkp.lists.linux.dev>

--===============8566269795929861653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 02:14:19AM +0100, Wolfram Sang wrote:
> On Mon, Mar 14, 2016 at 08:47:59AM +0800, kernel test robot wrote:
> > FYI, we noticed the below changes on
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux i2c/for-next
> > commit 95026658c46ea2d94498d0dac1282e28cd47c64a ("i2c: do not use inter=
nal data from driver core")
> =

> Ouch! So nobody of us ever boot-tested this patch? :( =


No. Sorry. It was only compile tested but Fengguang sent me the warning
before you applied the patch but I was travelling and so could not do anyth=
ing.

regards
sudip

--===============8566269795929861653==--

