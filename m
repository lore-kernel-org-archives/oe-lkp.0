Content-Type: multipart/mixed; boundary="===============5540156645503631263=="
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [dax] 23c84eb783: fio.write_bw_MBps -61.6% regression
Date: Fri, 18 Oct 2019 16:12:03 -0700
Message-ID: <CAPcyv4jjfT4xOQTrckEmX0Z_o6MbsmHz-qvCLAGSOPEe3-X0QA@mail.gmail.com>
In-Reply-To: <20191018094810.GB18593@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5540156645503631263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 2:48 AM Jan Kara <jack@suse.cz> wrote:
>
> Hello!
>
> On Fri 18-10-19 16:23:54, kernel test robot wrote:
> > FYI, we noticed a -61.6% regression of fio.write_bw_MBps due to commit:
> >
> >
> > commit: 23c84eb7837514e16d79ed6d849b13745e0ce688 ("dax: Fix missed wake=
up with PMD faults")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> Thanks for report! Please check whether commit 61c30c98ef17 "dax: Fix
> missed wakeup in put_unlocked_entry()" influences the throughput. Because
> without that fix, the identified commit may result in processes sleeping
> unnecessarily long on entry locks.

I've got several reports of v5.3 performance regressions tracking back
to this change. I instrumented the ndctl "dax.sh" unit test to
validate that it is getting huge page faults and it always falls back
to 4K starting with these commits. It looks like the xa_is_internal()
returns true for any DAX_LOCKED entry.
--===============5540156645503631263==--

