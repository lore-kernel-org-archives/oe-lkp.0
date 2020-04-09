Content-Type: multipart/mixed; boundary="===============1692065246614305080=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] 6471384af2: phoronix-test-suite.darktable.Masskrug.CPU-only.seconds 10.2% regression
Date: Thu, 09 Apr 2020 16:03:31 +0200
Message-ID: <20200409140331.GK18386@dhcp22.suse.cz>
In-Reply-To: <20200409135029.GA2072@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1692065246614305080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 09-04-20 21:50:29, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 10.2% regression of phoronix-test-suite.darktable.Massk=
rug.CPU-only.seconds due to commit:
> =

> =

> commit: 6471384af2a6530696fc0203bafe4de41a23c9ef ("mm: security: introduc=
e init_on_alloc=3D1 and init_on_free=3D1 boot options")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
[...]
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=3Dy
> CONFIG_INIT_ON_FREE_DEFAULT_ON=3Dy

So the feature is enabled by default and therefore this is no
regression. The feature is expected to have an overhead. It is nice to
see that quantified. These numbers roughly match those presented when
the feature was enabled.
-- =

Michal Hocko
SUSE Labs
--===============1692065246614305080==--

