Content-Type: multipart/mixed; boundary="===============0145764065396906324=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: ffbe758dbb [ 0.052456] Kernel panic - not syncing: Can't create rootfs
Date: Wed, 08 Aug 2018 11:26:23 +0100
Message-ID: <18008.1533723983@warthog.procyon.org.uk>
In-Reply-To: <33324432-64e8-2349-a3d5-ec7592d3693b@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0145764065396906324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong Chen <rong.a.chen@intel.com> wrote:

> >> [    0.052449] smack: Unknown parameter 'source'
> > That is the actual problem.  I think this should be fixed by the attach=
ed
> > patch.  I can replicate it with SELinux by removing the equivalent line=
 from
> > there.
> results of the attached patch:
> boot_successes: 0
> boot_failures: 118
> BUG:kernel_hang_in_boot_stage: 118

Can you give a revised boot log?

David

--===============0145764065396906324==--

