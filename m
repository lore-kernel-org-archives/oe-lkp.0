Content-Type: multipart/mixed; boundary="===============0342425258643470758=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Mon, 22 Dec 2014 10:49:40 -0800
Message-ID: <20141222184940.GB17192@tassilo.jf.intel.com>
In-Reply-To: <CADnq5_MY3+4BdWzUYffTnRWF3J4Z7nb6zyrGZK4RNwVU3axvuw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0342425258643470758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2014 at 11:58:43AM -0500, Alex Deucher wrote:
> On Mon, Dec 22, 2014 at 6:11 AM, Oded Gabbay <oded.gabbay@amd.com> wrot=
e:
> > amdkfd driver can be compiled only in 64-bit kernel. Therefore, there i=
s no
> > point in trying to initialize amdkfd in 32-bit kernel.
> >
> > In addition, in case of specific configuration of 32-bit kernel, no mod=
ules and
> > random kernel base, the symbol_request function doesn't work as expecte=
d - It
> > doesn't return NULL if the symbol doesn't exists. That makes the kernel=
 panic.
> > Therefore, the as amdkfd doesn't compile in 32-bit kernel, the best way=
 is just
> > to return false immediately.
> >
> > Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>
> =

> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Sorry but the patch is just bogus. X-bit only code is usually
a very bad sign for the code. This is not windows programing after all.

Even if you wanted to do a 64bit only driver -- which
you probably don't -- the standard way would be to exclude
it in Kconfig.

Please root-cause why symbol_request doesn't work on 32bit
and fix it properly.

+rusty.

-Andi


--===============0342425258643470758==--

