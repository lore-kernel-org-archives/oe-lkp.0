Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BC125CC
	for <oe-lkp@lists.linux.dev>; Tue,  6 Jun 2023 18:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CLlX0vggMROMtuqvN2c1dj9w/eUmy+R/m6XCbHJiuHU=; b=q19aI4oE+OYFJEiFSUfnZCHRem
	Rg77BMJz0qwU8mdJdu5sE7SuM3oNKzVducd2u0+mrDXqcJyvZg4Km/bek/Tgdsw7nVet/kOaHjMcO
	LkVKFZpGLNqmWcm4jMCOlYQcw+Z4dEdgMQXl1bf1J7vKQ3elP7q1VVxxsuZ2UNUU/Lf3H3VkcoglP
	5g6eYrmxBScK5LD1z/9qfj+h8u+V+qbrc2qNul11Poy+qe3YkkHqPZiGOVnEyM0RzcyMZwfZXn1uL
	h9bdySazRx6xvkGc9Mz0PE54OY0bFd8EfrDt09xbrWAaANd7JaWpgg6PdFqsOdObFjG/wp8g7CM8g
	YCOTMQ8Q==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q6bil-002oDx-1W;
	Tue, 06 Jun 2023 18:47:55 +0000
Date: Tue, 6 Jun 2023 11:47:55 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Joel Granados <j.granados@samsung.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 6/8] test_sysclt: Test for registering a mount point
Message-ID: <ZH9/WxPIPj2y2PkO@bombadil.infradead.org>
References: <CGME20230604144143eucas1p1ba7a3773905187be28571e973ef6e118@eucas1p1.samsung.com>
 <202306042234.f2d7beff-oliver.sang@intel.com>
 <20230606092717.uesyzrptbsbzefbq@localhost>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606092717.uesyzrptbsbzefbq@localhost>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Tue, Jun 06, 2023 at 11:27:17AM +0200, Joel Granados wrote:
> On Sun, Jun 04, 2023 at 10:41:05PM +0800, kernel test robot wrote:
> @mcgrof: Can we just ignore this 0-day report as a false positive?

Yes, thanks for highlighting it.

 Luis
