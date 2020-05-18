Content-Type: multipart/mixed; boundary="===============5006844918962044369=="
MIME-Version: 1.0
From: James Morse <james.morse@arm.com>
To: lkp@lists.01.org
Subject: Re: [ACPI] b13663bdf9: BUG:sleeping_function_called_from_invalid_context_at_kernel/locking/mutex.c
Date: Mon, 18 May 2020 19:08:17 +0100
Message-ID: <438c1743-5c8a-287d-3f97-e4a451ae8027@arm.com>
In-Reply-To: <CAPcyv4jKZp2bOZZ+ZMrcbFw9fPzeDu8waqwG6mBVpWwGq2DGtw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5006844918962044369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi guys,

On 12/05/2020 19:05, Dan Williams wrote:
> On Tue, May 12, 2020 at 9:28 AM Rafael J. Wysocki
> <rafael.j.wysocki@intel.com> wrote:
>> Dan,
>>
>> Has this been addressed in the v2?
> =

> No, this looks like a case I was concerned about, i.e. the GHES code
> is not being completely careful to avoid calling potentially sleeping
> functions with interrupts disabled. There is the nice comment that
> indicates that the fixmap should be used when ghes_notify_lock_irq()
> is held, but there seems to be no infrastructure to use / divert to
> the fixmap in the ghes_proc() path.

ghes_map()/ghes_unmap() use the fixmap for reading the firmware provided re=
cords,
but this came through apei_read(), which claims to be IRQ and NMI safe...


> That needs to be reworked first.
> It seems the implementation was getting lucky before to hit the cached
> acpi_ioremap in this path under rcu_read_lock(), but it appears it
> should have always been using the fixmap. Ying, James, is my read
> correct?

The path through this thing is pretty tortuous: The static HEST contains th=
e address of
the pointer that firmware updates to point to CPER records when they are ge=
nerated. This
pointer might be static (records are always in the same place), it might no=
t.

The address in the tables is static. ghes.c maps it in ghes_new():
|	rc =3D apei_map_generic_address(&generic->error_status_address);

which happens before the ghes_add_timer()/request_irq()/ghes_nmi_add() stuf=
f, so we should
always use the existing mapping.

__ghes_peek_estatus() reads the pointer with apei_read(), which should use =
the mapping
from ghes_new(), then uses ghes_copy_tofrom_phys() which uses the fixmap to=
 read the CPER
records.


Does apei_map_generic_address() no longer keep the GAR/address mapped?
(also possible I've totally mis-understood how ACPIs caching of mappings wo=
rks!)


Thanks,

James
--===============5006844918962044369==--

