Content-Type: multipart/mixed; boundary="===============8389448425644601795=="
MIME-Version: 1.0
From: Christopher Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/kconfig] 81d3871900: BUG:unable_to_handle_kernel
Date: Thu, 12 Oct 2017 12:05:04 -0500
Message-ID: <alpine.DEB.2.20.1710121202210.28556@nuc-kabylake>
In-Reply-To: <20171011170120.7flnk6r77dords7a@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============8389448425644601795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Oct 2017, Josh Poimboeuf wrote:

> I failed to add the slab maintainers to CC on the last attempt.  Trying
> again.


Hmmm... Yea. SLOB is rarely used and tested. Good illustration of a simple
allocator and the K&R mechanism that was used in the early kernels.

> > Adding the slub maintainers.  Is slob still supposed to work?

Have not seen anyone using it in a decade or so.

Does the same config with SLUB and slub_debug on the commandline run
cleanly?

> > I have no idea how that crypto panic could could be related to slob, but
> > at least it goes away when I switch to slub.

Can you run SLUB with full debug? specify slub_debug on the commandline or
set CONFIG_SLUB_DEBUG_ON


--===============8389448425644601795==--

