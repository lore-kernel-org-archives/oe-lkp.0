Content-Type: multipart/mixed; boundary="===============1008856206747374994=="
MIME-Version: 1.0
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [tpm] b008bd39b1: kmsg.tpm_tpm#:A_TPM_error(#)occurred_attempting_get_random
Date: Tue, 02 Jan 2018 16:44:01 +0200
Message-ID: <20180102144401.64w3foy3ztwx6ndd@linux.intel.com>
In-Reply-To: <20171227201114.GE25436@ziepe.ca>
List-Id: <oe-lkp.lists.linux.dev>

--===============1008856206747374994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2017 at 01:11:14PM -0700, Jason Gunthorpe wrote:
> On Wed, Dec 27, 2017 at 10:55:32AM +0800, kernel test robot wrote:
> =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > [    5.903660] tpm_tis 00:05: 1.2 TPM (device-id 0xFE, rev-id 70)
> > [    5.934271] tpm tpm0: A TPM error (7) occurred attempting to read a =
pcr value
> > [    5.941471] tpm tpm0: TPM is disabled/deactivated (0x7)
> > [    5.953053] tpm tpm0: A TPM error (7) occurred attempting get random
> =

> Should the BIOS expose a disabled/deactivated TPM to the operating
> system?
> =

> Jason

Nope.

/Jarkko

--===============1008856206747374994==--

