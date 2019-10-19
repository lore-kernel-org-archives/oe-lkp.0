Content-Type: multipart/mixed; boundary="===============8746180944441531465=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [dax] 23c84eb783: fio.write_bw_MBps -61.6% regression
Date: Sat, 19 Oct 2019 14:35:56 -0700
Message-ID: <20191019213556.GO32665@bombadil.infradead.org>
In-Reply-To: <CAPcyv4jjfT4xOQTrckEmX0Z_o6MbsmHz-qvCLAGSOPEe3-X0QA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8746180944441531465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 04:12:03PM -0700, Dan Williams wrote:
> I've got several reports of v5.3 performance regressions tracking back
> to this change. I instrumented the ndctl "dax.sh" unit test to
> validate that it is getting huge page faults and it always falls back
> to 4K starting with these commits. It looks like the xa_is_internal()
> returns true for any DAX_LOCKED entry.

That's not true today, but I do intend to make it true at some point.
I think we can reclaim three bits from the encoding of a DAX entry,
allowing us to support three more physical bits on a 32-bit system.
Clearly that hasn't been a focus so far.

The plan is ...

DAX_LOCKED -> XA_LOCK_ENTRY (xa_mk_internal(something))

DAX_ZERO_PAGE -> XA_ZERO_ENTRY

DAX_EMPTY goes away.  It's only used in combination with DAX_LOCKED, and
it won't be necessary once DAX_LOCKED has become XA_LOCK_ENTRY.

DAX_PMD essentially stays, but we can encode arbitrary orders using a single
bit rather than just PTE vs PMD.

We may need to encode a size in DAX_LOCKED, or we may be able to get that
information from the XArray.  Anyway, this transformation is about tenth
on my todo list right now, so if someone else wants to take this on ...
--===============8746180944441531465==--

