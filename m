Content-Type: multipart/mixed; boundary="===============4353145920270950290=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [gpio] f69e00bd21: unixbench.score -24.2% regression
Date: Mon, 22 Jul 2019 09:27:50 +0800
Message-ID: <20190722012750.GB50506@shbuild999.sh.intel.com>
In-Reply-To: <CACRpkdYmtgO_E-KKE8zjA04POawJ=4RN3xFUPY__7GF+gSNbNQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4353145920270950290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, Jul 17, 2019 at 05:42:15AM +0800, Linus Walleij wrote:
> On Wed, Jul 10, 2019 at 2:15 PM kernel test robot <rong.a.chen@intel.co=
m> wrote:
> =

> > FYI, we noticed a -24.2% regression of unixbench.score due to commit:
> > commit: f69e00bd21aa6a1961c521b6eb199137fcb8a76a ("gpio: mmio: Support =
two direction registers")
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux=
.git master
> =

> That's pretty bogus since the test doesn't even seem to be using GPIO.
> Further AFAIK Intel chips don't even use that driver.
> =

> Can you provide some rootcausing?

We did some further check, and found this is a false alarm. That some recen=
t =

change to LKP itself has enabled the latencytop for newer kernel(post 5.1-r=
c1),
and latencytop is known to bring extra system load to scheduling related
benchmarks like unixbench, which caused this -24.7 difference of unixbench
score. Sorry for the noise.

Thanks,
Feng


> If you are using GPIOs from userspace in the test somehow I am
> sure both me and Bartosz would be interested to hear how.
> =

> Yours,
> Linus Walleij
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============4353145920270950290==--

