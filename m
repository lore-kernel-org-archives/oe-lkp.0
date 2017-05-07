Content-Type: multipart/mixed; boundary="===============7886614716628856942=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [EDAC] e3c4ff6d8c: kmsg.EDAC_sbridge:Failed_to_register_device_with_error
Date: Sun, 07 May 2017 19:13:59 +0200
Message-ID: <20170507171359.tm6yybbtfwdfu2qs@pd.tnic>
In-Reply-To: <20170426210602.GA4839@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7886614716628856942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 26, 2017 at 02:06:02PM -0700, Luck, Tony wrote:
> If there were a sane way for the ghes_edac driver to find out
> that it was running on a platform that supported these GHES
> error reports from the BIOS, then it would be able to decide
> whether to register.
> =

> But I don't think there is :-(
> =

> So we can either let the user pick.

So, in thinking about this more, I am gravitating towards letting the
user pick. For the simple reason that, most of the time she/he should
know better than some heuristic mechanism we have in the kernel.

I mean, how do you detect if the firmware generates correct error
reports and the specific platform driver is not needed?

Lemme see how ugly the conversion of ghes_edac into a proper module
would look...

-- =

Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--=20

--===============7886614716628856942==--

