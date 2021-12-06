// Prove that 1)-4) are all equivalent for connected 
// graph G:
// 1) Graph G is acyclic
// 2) For any u,v from G exactly one way u->v exists
// 3) G would become disconnected 
//    if any single edge is removed
// 4) |nodes| = |edges| + 1


sig Node
{}

sig Edge
{
    u,v: Node
}

sig Graph
{
    edges: set Edge
}




pred hasNode [uv: Edge, n: Node]
{
	uv.v = n || uv.u = n
}

pred isCycle [cycle: some Edge]
{
    all edge: Edge | edge in cycle implies ( 
    ( one l: Edge | l in cycle && l.hasNode[edge.u] ) &&
    ( one r: Edge | r in cycle && r.hasNode[edge.v] ))
}




// 0)
pred isConnected [g: Graph]
{
	//all e1,e2: g.edges | // упорядоченное множество edges, начинающееся
	// e1 и кончающееся e2
	1 = 1
}

// 1)
pred isAcyclic [g: Graph]
{
    no cycle: some Edge |
    cycle in g.edges && cycle.isCycle
}

// 3)
pred minimallyConnected [g: Graph]
{
    all edge: g.edges |
		(some g0: Graph |
			((g0.edges = g.edges - edge) && !g0.isConnected))
}

// 4)
pred NodesEdgesPlus1 [g: Graph]
{
	1 = 1
    // g.getNodes.size = 1 + g.edges.size
	// how to measure size?
}





check { all g: Graph | g.isConnected implies (g.isAcyclic iff g.minimallyConnected)}
for 3 but 10 Graph






//pred isParentOf [a: Node, b: Node]
//{
//	a.left == b || a.right == b
//}

//pred higherThan [a: Node, b: Node]
//{
//	a in b.^parent
//}

//pred isAcyclic [root: Node]
//{
//	no a: Node | root.higherThan[a]
//	&& a.higherThan[a] 
//}


