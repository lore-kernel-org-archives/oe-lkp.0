Content-Type: multipart/mixed; boundary="===============9197688042165971430=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [locking/mutexes] cb4bbc457b: -40.0% unixbench.score
Date: Thu, 21 Jan 2016 18:48:01 -0800
Message-ID: <20160122024801.GA23224@linux-uzut.site>
In-Reply-To: <874me6jql0.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9197688042165971430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Jan 2016, kernel test robot wrote:

>FYI, we noticed the below changes on
>
>https://github.com/0day-ci/linux Ding-Tianhong/locking-mutexes-don-t-spin-=
on-owner-when-wait-list-is-not-NULL/20160121-173317
>commit cb4bbc457bfed6194ffab1b10c7be73b3f16ca2d ("locking/mutexes: don't s=
pin on owner when wait list is not NULL.")

I'm not sure why this would even be reported, as this patch has not been ac=
cepted
or acked or nothin', by anyone. In this particular case that raw performanc=
e drop
is because spinning is pretty much disabled by Ding's change. Totally expec=
ted for
the kind of workload unixbench triggers.

All this does is hurt lkml-searchability.

Thanks,
Davidlohr

--===============9197688042165971430==--

