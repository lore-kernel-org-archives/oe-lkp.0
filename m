Content-Type: multipart/mixed; boundary="===============5437675444892951192=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [ahci] 6cb1c51aa6: ahci 0000:00:1f.2: failed to enable MSI-X with error -22, # of vectors: 3
Date: Wed, 11 Nov 2015 10:49:55 -0500
Message-ID: <20151111154955.GA6246@mtj.duckdns.org>
In-Reply-To: <878u66d2f4.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5437675444892951192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 10:16:31AM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/libata for-4.4
> commit 6cb1c51aa65039ab3860c9741f9a190b7ab199cb ("ahci: per-port msix sup=
port")

So, this commit didn't end up making 4.4 but will probably get merged
into for-4.5 once rc1 drops.  Dan, can you please see what's up with
the error message?

Thanks.

-- =

tejun

--===============5437675444892951192==--

