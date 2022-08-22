Content-Type: multipart/mixed; boundary="===============5552283602482310354=="
MIME-Version: 1.0
From: Roman Gushchin <roman.gushchin@linux.dev>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Mon, 22 Aug 2022 11:27:46 -0700
Message-ID: <YwPKojTHxV4PFoKn@P9FQF9L96D>
In-Reply-To: <CALvZod4whYX+0ZuCGgyKuG-Q_9d0g7N_x+=WXOeB_1TM=3Q7vg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5552283602482310354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 09:04:59AM -0700, Shakeel Butt wrote:
> On Mon, Aug 22, 2022 at 8:15 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 22-08-22 08:06:14, Shakeel Butt wrote:
> > [...]
> > > > >  struct page_counter {
> > > > > +     /*
> > > > > +      * Make sure 'usage' does not share cacheline with any othe=
r field. The
> > > > > +      * memcg->memory.usage is a hot member of struct mem_cgroup.
> > > > > +      */
> > > > > +     PC_PADDING(_pad1_);
> > > >
> > > > Why don't you simply require alignment for the structure?
> > >
> > > I don't just want the alignment of the structure. I want different
> > > fields of this structure to not share the cache line. More
> > > specifically the 'high' and 'usage' fields. With this change the usage
> > > will be its own cache line, the read-most fields will be on separate
> > > cache line and the fields which sometimes get updated on charge path
> > > based on some condition will be a different cache line from the
> > > previous two.
> >
> > I do not follow. If you make an explicit requirement for the structure
> > alignement then the first field in the structure will be guarantied to
> > have that alignement and you achieve the rest to be in the other cache
> > line by adding padding behind that.
> =

> Oh, you were talking explicitly about _pad1_, yes, we can remove it
> and make the struct cache align. I will do it in the next version.

Yes, please, it caught my eyes too.
With this change:
Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Also, can you, please, include the numbers on the additional memory overhea=
d?
I think it still worth it, just think we need to include them for a record.

Thanks!
--===============5552283602482310354==--

