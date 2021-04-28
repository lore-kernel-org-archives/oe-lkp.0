Content-Type: multipart/mixed; boundary="===============0340193399928581316=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Wed, 28 Apr 2021 10:56:16 +0200
Message-ID: <87o8dyn5xr.ffs@nanos.tec.linutronix.de>
In-Reply-To: <20210428080819.GB53821@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0340193399928581316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28 2021 at 16:08, Feng Tang wrote:
> On Wed, Apr 28, 2021 at 07:01:35AM +0000, Song Bao Hua (Barry Song) wrote:
>
>> But it is still an irrelevant problem.
> Yes, the commit itself has no problem. And my personal thought
> is no further action is needed. =


The commit does not need any further action, but this testing stuff
really needs further action because we can't differentiate between real
regressions and these bogus reports anymore.

Thanks,

        tglx
--===============0340193399928581316==--

