Content-Type: multipart/mixed; boundary="===============5418484974397102786=="
MIME-Version: 1.0
From: Maurizio Lombardi <mlombard@redhat.com>
To: lkp@lists.01.org
Subject: Re: [Merge branch 'for] BUG: unable to handle kernel NULL pointer dereference at 0000000000000028
Date: Fri, 11 Jul 2014 16:58:56 +0200
Message-ID: <53BFFBB0.7060709@redhat.com>
In-Reply-To: <53BBB30F.7020304@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5418484974397102786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 07/08/2014 10:59 AM, Aaron Lu wrote:
> The merge 49b3f10e2cf5c1c25d2ce33ab255cff8a8096ce6 seems to have only one
> commit: 254c4407cb84a6dec90336054615b0f0e996bb7c, so I added you guys in.
> Please take a look if this is a real problem, thanks.
> =

> =

> [ 1010.593031]  sda: unknown partition table
> [ 1010.598052] sd 2:0:0:0: [sda] Attached SCSI disk
> [ 1012.893125] sd 2:0:0:0: [sda] Synchronizing SCSI cache
> [ 1012.895934] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000028
> [ 1012.896336] IP: [<ffffffff813cf880>] blk_throtl_drain+0x30/0x150

I tried to revert my patch (commit 254c4407cb84a6dec90336054615b0f0e996bb7c)
but I'm still able to hit the very same kernel panic in linux-next, so I th=
ink
my patch is not the one to blame.

I was able to reproduce the error in a more easier way:
just execute the "reboot" command after the system boot is finished.

Regards,
Maurizio Lombardi

--===============5418484974397102786==--

