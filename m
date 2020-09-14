Content-Type: multipart/mixed; boundary="===============5556787842811045124=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm] 2037ab69a5: BUG:KASAN:null-ptr-deref_in_t
Date: Mon, 14 Sep 2020 12:27:38 +0100
Message-ID: <20200914112738.GM6583@casper.infradead.org>
In-Reply-To: <20200914085545.GB28738@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5556787842811045124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 04:55:45PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 2037ab69a5cd8afe58347135010f6160ea368dd0 ("mm: Convert find_get_e=
ntry to return the head page")

Thank you!

diff --git a/mm/swap_state.c b/mm/swap_state.c
index c2fb62f660a5..a22c2430e80c 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -427,6 +427,8 @@ struct page *find_get_incore_page(struct address_space =
*mapping, pgoff_t index)
 	struct swap_info_struct *si;
 	struct page *page =3D find_get_entry(mapping, index);
 =

+	if (!page)
+		return page;
 	if (!xa_is_value(page))
 		return find_subpage(page, index);
 	if (!shmem_mapping(mapping))

--===============5556787842811045124==--

