Content-Type: multipart/mixed; boundary="===============0148096009181960144=="
MIME-Version: 1.0
From: Michal Koutný <mkoutny@suse.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Fri, 29 Apr 2022 15:10:05 +0200
Message-ID: <20220429131004.GA22034@blackbody.suse.cz>
In-Reply-To: <85da8df9-d6ae-5a06-a561-13eaf11344d7@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0148096009181960144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello.

On Wed, Sep 08, 2021 at 11:13:57AM +0300, Vasily Averin <vvs@virtuozzo.co=
m> wrote:
> Please keep me informed about these tasks too. Unfortunately I cannot hel=
p right now,
> however perhaps we will need to backport these patches to OpenVz kernels.=
  =


Is there any progress around this POSIX lock efficient charging?
(Basically I'm just asking whether there's anything to base on now
except the former theoretical idea.)

Some people give this a security weight [1].

Thanks,
Michal

[1] https://github.com/kata-containers/kata-containers/issues/3373

--===============0148096009181960144==--

