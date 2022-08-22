Content-Type: multipart/mixed; boundary="===============8164338445979632922=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Mon, 22 Aug 2022 17:15:07 +0200
Message-ID: <YwOde3qFvne7Umld@dhcp22.suse.cz>
In-Reply-To: <CALvZod5pw_7hnH44hdC3rDGQxQB2XATrViNNGosG3FnUoWo-4A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8164338445979632922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 08:06:14, Shakeel Butt wrote:
[...]
> > >  struct page_counter {
> > > +     /*
> > > +      * Make sure 'usage' does not share cacheline with any other fi=
eld. The
> > > +      * memcg->memory.usage is a hot member of struct mem_cgroup.
> > > +      */
> > > +     PC_PADDING(_pad1_);
> >
> > Why don't you simply require alignment for the structure?
> =

> I don't just want the alignment of the structure. I want different
> fields of this structure to not share the cache line. More
> specifically the 'high' and 'usage' fields. With this change the usage
> will be its own cache line, the read-most fields will be on separate
> cache line and the fields which sometimes get updated on charge path
> based on some condition will be a different cache line from the
> previous two.

I do not follow. If you make an explicit requirement for the structure
alignement then the first field in the structure will be guarantied to
have that alignement and you achieve the rest to be in the other cache
line by adding padding behind that.

-- =

Michal Hocko
SUSE Labs
--===============8164338445979632922==--

