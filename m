Content-Type: multipart/mixed; boundary="===============0085264135889932815=="
MIME-Version: 1.0
From: Christoph Lameter <cl@linux.com>
To: lkp@lists.01.org
Subject: Re: [test_power_init] WARNING: CPU: 1 PID: 1 at lib/debugobjects.c:263 debug_print_object()
Date: Fri, 07 Aug 2015 13:34:08 -0500
Message-ID: <alpine.DEB.2.11.1508071333240.17393@east.gentwo.org>
In-Reply-To: <alpine.DEB.2.11.1508061533340.8172@east.gentwo.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0085264135889932815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hmmmm... Okay so someone is holding a lock on the structure that is being
freed. Has nothing to do with slab allocation.

--===============0085264135889932815==--

