Content-Type: multipart/mixed; boundary="===============0596976558391389107=="
MIME-Version: 1.0
From: Aristeu Rozanski <aris@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sb_edac] 50d1bb93672: EDAC sbridge: ECC is disabled. Aborting
Date: Mon, 05 Jan 2015 09:06:06 -0500
Message-ID: <20150105140606.GA25309@redhat.com>
In-Reply-To: <1418966819.26403.33.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0596976558391389107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,
On Fri, Dec 19, 2014 at 01:26:59PM +0800, Huang Ying wrote:
> In fact, I am not complaining :-), just FYI. As I said, this may be a
> expected behavior because this is a Haswell machine and the Haswell
> support was added in this patch.
> =

> > From the above, what looks weird, from EDAC driver PoV, is:
> > 	[   12.506298] EDAC sbridge: ECC is disabled. Aborting
> =

> This is what I want help from you to confirm whether it is abnormal.
> =

> > Does it used to work before? If so, was there any BIOS setting change?
> > Does the memories used on this machine have ECC?
> =

> This is a high-end desktop, there is something as below in dmidecode
> output.  Is there some other way to tell whether the memories have ECC?
> =

> Handle 0x0018, DMI type 16, 23 bytes
> Physical Memory Array
>         Location: System Board Or Motherboard
>         Use: System Memory
>         Error Correction Type: Multi-bit ECC
>         Maximum Capacity: 128 GB
>         Error Information Handle: Not Provided
>         Number Of Devices: 4
> =

> Handle 0x001A, DMI type 17, 34 bytes
> Memory Device
>         Array Handle: 0x0018
>         Error Information Handle: Not Provided
>         Total Width: 72 bits
>         Data Width: 72 bits
>         Size: 8192 MB
>         Form Factor: DIMM
>         Set: None
>         Locator: DIMM_A1
>         Bank Locator: CPU 0
>         Type: <OUT OF SPEC>
>         Type Detail: Synchronous
>         Speed: 1067 MHz
>         Manufacturer: 0x11
>         Serial Number: Unknown
>         Asset Tag: Unknown
>         Part Number: Unknown
>         Rank: 1
>         Configured Clock Speed: Unknown

unfortunately with this I can't say :(
Do you mind checking on EFI or maybe looking at the memory modules' part
number?

(sorry for the delay, was on vacations since 12/18)

-- =

Aristeu


--===============0596976558391389107==--

