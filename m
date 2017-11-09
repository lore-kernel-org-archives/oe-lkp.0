Content-Type: multipart/mixed; boundary="===============0630026801034486266=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm] 47bd678bc7: WARNING:at_mm/workingset.c:#scan_shadow_nodes
Date: Wed, 08 Nov 2017 16:03:24 -0800
Message-ID: <20171109000324.GD8522@tassilo.jf.intel.com>
In-Reply-To: <20171108015629.GA22793@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0630026801034486266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> kern  :warn  : [  348.637225] WARNING: CPU: 3 PID: 53 at mm/workingset.c:=
456 scan_shadow_nodes+0x240/0x260

Thanks.

It's likely the truncate problem found by Hannes during review.

Next revision should fix it.

-Andi

--===============0630026801034486266==--

