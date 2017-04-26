Content-Type: multipart/mixed; boundary="===============5931435178843582841=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC] e3c4ff6d8c: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Thu, 27 Apr 2017 00:20:09 +0200
Message-ID: <20170426222009.gsl4tjmuvm4ljk6t@pd.tnic>
In-Reply-To: <20170426210602.GA4839@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5931435178843582841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 02:06:02PM -0700, Luck, Tony wrote:
> Then we'd try to load some other driver: sb_edac, skx_edac, etc. If
> they get through the platform tests to find they are on the right
> cpu model, and they find all the right PCIe devices to access memory
> controller registers ... then they call edac_mc_add_mc() to tell
> EDAC core they want to run things ... and that supplants ghes_edac.

Yeah, but that means a serious EDAC core surgery as we've never
supported more than one EDAC driver. What would be easier, IMO,
is to move the reporting functionality from ghes_edac.c to
drivers/acpi/apei/ghes.c and export only the EDAC tracepoint so that
GHES can call into it. Through a notifier or so.

This way we'll get rid of the ghes_edac.c thing completely the
functionality will be completely part of ghes.c in drivers/acpi/ and
then we can load our platform drivers just the same.

But that's definitely future work.

I'd still like to apply the oneliner for 4.12 so that the bug Xiaolong
reported doesn't happen. Ok?

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============5931435178843582841==--

